#!/usr/bin/env bash
# Marks the tmux window of a Claude Code session with the agent state,
# so the status line can show which agent is working, waiting or done.
# Usage: agent-state.sh working|waiting|done|clear
# Install the hooks with install-claude-hooks.sh.

[ -n "$TMUX_PANE" ] || exit 0

if [ "$1" = "clear" ]; then
  tmux set-option -wu -t "$TMUX_PANE" @agent_state
else
  tmux set-option -w -t "$TMUX_PANE" @agent_state "$1"
fi

exit 0
