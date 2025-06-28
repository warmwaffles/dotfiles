all: install

install:
	mkdir -p $(HOME)/.config
	stow --target $(HOME) -S alacritty
	stow --target $(HOME) -S bat
	stow --target $(HOME) -S bspwm
	stow --target $(HOME) -S clang
	stow --target $(HOME) -S dunst
	stow --target $(HOME) -S editorconfig
	stow --target $(HOME) -S fish
	stow --target $(HOME) -S general
	stow --target $(HOME) -S git
	stow --target $(HOME) -S nvim
	stow --target $(HOME) -S paru
	stow --target $(HOME) -S psql
	stow --target $(HOME) -S rofi
	stow --target $(HOME) -S scripts
	stow --target $(HOME) -S vim
	stow --target $(HOME) -S theme
	stow --target $(HOME) -S helix
	stow --target $(HOME) -S yazi
	stow --target $(HOME) -S gitui
	stow --target $(HOME) -S lazygit
	stow --target $(HOME) -S ghostty
	stow --target $(HOME) -S kitty
	stow --target $(HOME) -S zellij

uninstall:
	stow --target $(HOME) -D alacritty
	stow --target $(HOME) -D bat
	stow --target $(HOME) -D bspwm
	stow --target $(HOME) -D clang
	stow --target $(HOME) -D dunst
	stow --target $(HOME) -D editorconfig
	stow --target $(HOME) -D fish
	stow --target $(HOME) -D general
	stow --target $(HOME) -D git
	stow --target $(HOME) -D nvim
	stow --target $(HOME) -D paru
	stow --target $(HOME) -D psql
	stow --target $(HOME) -D rofi
	stow --target $(HOME) -D scripts
	stow --target $(HOME) -D vim
	stow --target $(HOME) -D theme
	stow --target $(HOME) -D helix
	stow --target $(HOME) -D yazi
	stow --target $(HOME) -D gitui
	stow --target $(HOME) -D lazygit
	stow --target $(HOME) -D ghotty
	stow --target $(HOME) -D kitty
	stow --target $(HOME) -D zellij
