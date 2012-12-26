set completion-ignore-case On

# Loads files in .bash folder
for file in ~/.bash/{shell,commands,prompt,aliases,.git-completion.bash,symfony2-autocomplete.bash}; do
	[ -r "$file" ] && source "$file";
done;
unset file;