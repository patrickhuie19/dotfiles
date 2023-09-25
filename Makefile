# Makefile
SHELL := /bin/zsh

clean:
	# Backup
	cp ~/.zshrc ~/.zshrc.backup
	cp ~/.tmux.conf ~/.tmux.conf.backup
	# Remove existing files if they exist
	[ ! -e ~/.zshrc ] || rm ~/.zshrc
	[ ! -e ~/.tmux.conf ] || rm ~/.tmux.conf


install:
	# Create or append to ~/.zshrc
	[ -e ~/.zshrc ] || touch ~/.zshrc
	cat $(PWD)/.zshrc >> ~/.zshrc

	# Create or append to ~/.tmux.conf
	[ -e ~/.tmux.conf ] || touch ~/.tmux.conf
	cat $(PWD)/.tmux.conf >> ~/.tmux.conf

	# Source the changes
	source ~/.zshrc
	tmux source-file ~/.tmux.conf
	echo "Dotfiles updated and sourced!"
