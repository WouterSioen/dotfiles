set completion-ignore-case On

# Loads files in .bash folder
for file in ~/.bash/{shell,commands,prompt,aliases,symfony2-autocomplete.bash,bundler-exec/bundler-exec.sh}; do
	[ -r "$file" ] && source "$file";
done;
unset file;

# Loads files in bash_completion.d folder
for file in /usr/local/etc/bash_completion.d/{git-completion.bash,git-prompt.sh,tmux,symfony}; do
	[ -r "$file" ] && source "$file";
done;
unset file;

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/Users/woutersioen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
