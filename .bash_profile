set completion-ignore-case On

# Loads files in .bash folder
for file in ~/.bash/{shell,commands,prompt,aliases,symfony2-autocomplete.bash,bundler-exec}; do
	[ -r "$file" ] && source "$file";
done;
unset file;

# Loads files in bash_completion.d folder
for file in /usr/local/etc/bash_completion.d/{git-completion.bash,git-prompt.sh,tmux}; do
	[ -r "$file" ] && source "$file";
done;
unset file;
