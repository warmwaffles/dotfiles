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
# BSPWM
#

$(HOME)/.config/bspwm:
	mkdir -p $@

$(HOME)/.config/bspwm/polybar:
	mkdir -p $@

$(HOME)/.config/bspwm/sxhkd:
	mkdir -p $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/polybar/config.ini
$(HOME)/.config/bspwm/polybar/config.ini: $(HOME)/.config/bspwm/polybar
	ln -sf $(CWD)/bspwm/$(HOSTNAME)/polybar/config.ini $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/polybar/reload.sh
$(HOME)/.config/bspwm/polybar/reload.sh: $(HOME)/.config/bspwm/polybar
	ln -sf $(CWD)/bspwm/$(HOSTNAME)/polybar/reload.sh $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/sxhkd/launch.sh
$(HOME)/.config/bspwm/sxhkd/launch.sh: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/$(HOSTNAME)/sxhkd/launch.sh $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/sxhkd/reload.sh
$(HOME)/.config/bspwm/sxhkd/reload.sh: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/$(HOSTNAME)/sxhkd/reload.sh $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/sxhkd/sxhkdrc
$(HOME)/.config/bspwm/sxhkd/sxhkdrc: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/$(HOSTNAME)/sxhkd/sxhkdrc $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/bspwmrc
$(HOME)/.config/bspwm/bspwmrc: $(HOME)/.config/bspwm
	ln -sf $(CWD)/bspwm/$(HOSTNAME)/bspwmrc $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/reload.sh
$(HOME)/.config/bspwm/reload.sh: $(HOME)/.config/bspwm
	ln -sf $(CWD)/bspwm/reload.sh $@

#
# Fish
#

$(HOME)/.config/fish:
	mkdir -p $@

FISH_CONFIGS += $(HOME)/.config/fish/config.fish
$(HOME)/.config/fish/config.fish: $(HOME)/.config/fish
	ln -sf $(CWD)/fish/config.fish $@

#
# Dunst
#

$(HOME)/.config/dunst:
	mkdir -p $@

DUNST_CONFIGS += $(HOME)/.config/dunst/dunstrc
$(HOME)/.config/dunst/dunstrc: $(HOME)/.config/dunst
	ln -sf $(CWD)/dunst/dunstrc $@

DUNST_CONFIGS += $(HOME)/.config/dunst/colortest
$(HOME)/.config/dunst/colortest: $(HOME)/.config/dunst
	ln -sf $(CWD)/dunst/colortest $@

#
# Kitty
#

$(HOME)/.config/kitty: $(HOME)/.config
	mkdir -p $@

KITTY_CONFIGS += $(HOME)/.config/kitty/kitty.conf
$(HOME)/.config/kitty/kitty.conf:
	ln -sf $(CWD)/kitty/kitty.conf $@

#
# Alacritty
#

$(HOME)/.config/alacritty: $(HOME)/.config
	mkdir -p $@

ALACRITTY_CONFIGS += $(HOME)/.config/alacritty/alacritty.toml
$(HOME)/.config/alacritty/alacritty.toml: $(HOME)/.config/alacritty
	ln -sf $(CWD)/alacritty/alacritty.toml $@

#
# Rofi
#
$(HOME)/.config/rofi: $(HOME)/.config
	mkdir -p $@

ROFI_CONFIGS += $(HOME)/.config/rofi/config.rasi
$(HOME)/.config/rofi/config.rasi: $(HOME)/.config/rofi
	ln -sf $(CWD)/rofi/config.rasi $@

ROFI_CONFIGS += $(HOME)/.config/rofi/photon-blue.rasi
$(HOME)/.config/rofi/photon-blue.rasi: $(HOME)/.config/rofi
	ln -sf $(CWD)/rofi/photon-blue.rasi $@

#
# Packages
#

$(HOME)/.config/paru: $(HOME)/.config
	mkdir -p $@

PACKAGE_CONFIGS += $(HOME)/.config/paru/paru.conf
$(HOME)/.config/paru/paru.conf: $(HOME)/.config/paru
	ln -sf $(CWD)/paru/paru.conf $@

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
CONFIGS += $(ALACRITTY_CONFIGS)
CONFIGS += $(BSPWM_CONFIGS)
CONFIGS += $(DUNST_CONFIGS)
CONFIGS += $(FISH_CONFIGS)
CONFIGS += $(GENERAL_CONFIGS)
CONFIGS += $(GIT_CONFIGS)
CONFIGS += $(KITTY_CONFIGS)
CONFIGS += $(PACKAGE_CONFIGS)
CONFIGS += $(ROFI_CONFIGS)
CONFIGS += $(SCRIPTS)

install: $(CONFIGS)
	stow --target $(HOME) bat
	stow --target $(HOME) nvim
	stow --target $(HOME) vim
	stow --target $(HOME) zellij

uninstall:
	rm -f $(ALACRITTY_CONFIGS)
	rm -f $(BSPWM_CONFIGS)
	rm -f $(DUNST_CONFIGS)
	rm -f $(FISH_CONFIGS)
	rm -f $(GENERAL_CONFIGS)
	rm -f $(GIT_CONFIGS)
	rm -f $(KITTY_CONFIGS)
	rm -f $(PACKAGE_CONFIGS)
	rm -f $(ROFI_CONFIGS)
	rm -f $(SCRIPTS)
