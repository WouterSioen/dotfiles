#!/usr/bin/env bash
# Adds the Claude Code hooks that call agent-state.sh, so tmux tabs show
# whether an agent is working, waiting for input or done.
# Safe to run again: events that already call agent-state.sh are skipped.
# Usage: install-claude-hooks.sh [claude-config-directory]
#   e.g. install-claude-hooks.sh ~/.claude-mwl
# Defaults to $CLAUDE_CONFIG_DIR, or ~/.claude when that is not set.

set -euo pipefail

config_directory="${1:-${CLAUDE_CONFIG_DIR:-$HOME/.claude}}"
settings_file="$config_directory/settings.json"
agent_state_script="$(cd "$(dirname "$0")" && pwd)/agent-state.sh"

mkdir -p "$config_directory"
[ -f "$settings_file" ] || echo '{}' > "$settings_file"

updated_settings="$(jq --arg script "$agent_state_script" '
  def agent_state_hook(state):
    { hooks: [{ type: "command", command: "\($script) \(state)" }] };

  def add_hook(event; hook):
    if any(.hooks[event][]?.hooks[]?; .command | contains("agent-state.sh"))
    then .
    else .hooks[event] += [hook]
    end;

  add_hook("UserPromptSubmit"; agent_state_hook("working"))
  # Back to working once a permission prompt is answered
  | add_hook("PostToolUse"; agent_state_hook("working"))
  | add_hook("Notification"; agent_state_hook("waiting")
      + { matcher: "permission_prompt|elicitation_dialog|elicitation_url_dialog|agent_needs_input" })
  | add_hook("Stop"; agent_state_hook("done"))
  | add_hook("SessionEnd"; agent_state_hook("clear"))
' "$settings_file")"

echo "$updated_settings" > "$settings_file"
echo "Claude Code agent state hooks installed in $settings_file"
