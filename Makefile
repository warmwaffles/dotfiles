CWD=$(shell pwd)
HOSTNAME=$(shell hostname)

# install and uninstall are at the bottom of the file
all: install

$(HOME)/.config:
	mkdir -p $@

#
# Scripts
#

$(HOME)/.local/bin: $(HOME)/.local
	mkdir -p $@

SCRIPTS += $(HOME)/.local/bin/git-cleanup
$(HOME)/.local/bin/git-cleanup: $(HOME)/.local/bin
	ln -sf $(CWD)/bin/git-cleanup $@

SCRIPTS += $(HOME)/.local/bin/git-rename-default-branch
$(HOME)/.local/bin/git-rename-default-branch: $(HOME)/.local/bin
	ln -sf $(CWD)/bin/git-rename-default-branch $@

SCRIPTS += $(HOME)/.local/bin/add-desktop
$(HOME)/.local/bin/add-desktop: $(HOME)/.local/bin
	ln -sf $(CWD)/bin/add-desktop $@

SCRIPTS += $(HOME)/.local/bin/submerge
$(HOME)/.local/bin/submerge: $(HOME)/.local/bin
	ln -sf $(CWD)/bin/submerge $@

SCRIPTS += $(HOME)/.local/bin/open
$(HOME)/.local/bin/open: $(HOME)/.local/bin
	ln -sf $(CWD)/bin/open $@

SCRIPTS += $(HOME)/.local/bin/k3s-killall.sh
$(HOME)/.local/bin/k3s-killall.sh: $(HOME)/.local/bin
	ln -sf $(CWD)/bin/k3s-killall.sh $@


#
# Utility section to install and do book keeping
#

# Please keep this in alphabetical order. It makes life easier.
CONFIGS += $(PACKAGE_CONFIGS)
CONFIGS += $(SCRIPTS)

install: $(CONFIGS)
	stow --target $(HOME) alacritty
	stow --target $(HOME) bat
	stow --target $(HOME) bspwm
	stow --target $(HOME) clang
	stow --target $(HOME) dunst
	stow --target $(HOME) editorconfig
	stow --target $(HOME) fish
	stow --target $(HOME) general
	stow --target $(HOME) git
	stow --target $(HOME) nvim
	stow --target $(HOME) paru
	stow --target $(HOME) psql
	stow --target $(HOME) rofi
	stow --target $(HOME) vim
	stow --target $(HOME) zellij

uninstall:
	rm -f $(PACKAGE_CONFIGS)
	rm -f $(SCRIPTS)
