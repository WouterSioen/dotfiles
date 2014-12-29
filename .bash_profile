set completion-ignore-case On

# Loads files in .bash folder
for file in ~/.bash/{shell,commands,prompt,aliases,symfony2-autocomplete.bash}; do
	[ -r "$file" ] && source "$file";
done;
unset file;

if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi
