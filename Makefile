CWD=$(shell pwd)
HOSTNAME=$(shell hostname)

# install and uninstall are at the bottom of the file
all: install

$(HOME)/.config:
	mkdir -p $@

#
# Git Config
#

GIT_CONFIGS += $(HOME)/.gitattributes
$(HOME)/.gitattributes:
	ln -sf $(CWD)/gitattributes $@

GIT_CONFIGS += $(HOME)/.gitconfig
$(HOME)/.gitconfig:
	ln -sf $(CWD)/gitconfig $@

GIT_CONFIGS += $(HOME)/.gitignore
$(HOME)/.gitignore:
	ln -sf $(CWD)/gitignore $@

#
# General Configs
#

GENERAL_CONFIGS += $(HOME)/.dircolors
$(HOME)/.dircolors:
	ln -sf $(CWD)/dircolors $@

GENERAL_CONFIGS += $(HOME)/.clang-format
$(HOME)/.clang-format:
	ln -sf $(CWD)/clang-format $@

GENERAL_CONFIGS += $(HOME)/.editorconfig
$(HOME)/.editorconfig:
	ln -sf $(CWD)/editorconfig $@

GENERAL_CONFIGS += $(HOME)/.lldbinit
$(HOME)/.lldbinit:
	ln -sf $(CWD)/lldbinit $@

GENERAL_CONFIGS += $(HOME)/.psqlrc
$(HOME)/.psqlrc:
	ln -sf $(CWD)/psqlrc $@

GENERAL_CONFIGS += $(HOME)/.tool-versions
$(HOME)/.tool-versions:
	ln -sf $(CWD)/tool-versions $@

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
CONFIGS += $(GENERAL_CONFIGS)
CONFIGS += $(GIT_CONFIGS)
CONFIGS += $(PACKAGE_CONFIGS)
CONFIGS += $(SCRIPTS)

install: $(CONFIGS)
	stow --target $(HOME) alacritty
	stow --target $(HOME) bat
	stow --target $(HOME) bspwm
	stow --target $(HOME) dunst
	stow --target $(HOME) fish
	stow --target $(HOME) nvim
	stow --target $(HOME) paru
	stow --target $(HOME) rofi
	stow --target $(HOME) vim
	stow --target $(HOME) zellij

uninstall:
	rm -f $(GENERAL_CONFIGS)
	rm -f $(GIT_CONFIGS)
	rm -f $(PACKAGE_CONFIGS)
	rm -f $(SCRIPTS)
