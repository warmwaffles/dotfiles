CWD=$(shell pwd)

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

GENERAL_CONFIGS += $(HOME)/.vimrc
$(HOME)/.vimrc:
	ln -sf $(CWD)/vimrc $@

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
	ln -sf $(CWD)/bspwm/polybar/config.ini $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/polybar/reload.sh
$(HOME)/.config/bspwm/polybar/reload.sh: $(HOME)/.config/bspwm/polybar
	ln -sf $(CWD)/bspwm/polybar/reload.sh $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/sxhkd/launch.sh
$(HOME)/.config/bspwm/sxhkd/launch.sh: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/sxhkd/launch.sh $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/sxhkd/reload.sh
$(HOME)/.config/bspwm/sxhkd/reload.sh: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/sxhkd/reload.sh $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/sxhkd/sxhkdrc
$(HOME)/.config/bspwm/sxhkd/sxhkdrc: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/sxhkd/sxhkdrc $@

BSPWM_CONFIGS += $(HOME)/.config/bspwm/bspwmrc
$(HOME)/.config/bspwm/bspwmrc: $(HOME)/.config/bspwm
	ln -sf $(CWD)/bspwm/bspwmrc $@

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
# NVim
#

$(HOME)/.config/nvim: $(HOME)/.config
	mkdir -p $@

NEOVIM_CONFIGS += $(HOME)/.config/nvim/init.lua
$(HOME)/.config/nvim/init.lua: $(HOME)/.config/nvim
	ln -sf $(CWD)/nvim/init.lua $@

#
# Utility section to install and do book keeping
#

# Please keep this in alphabetical order. It makes life easier.
CONFIGS += $(BSPWM_CONFIGS)
CONFIGS += $(DUNST_CONFIGS)
CONFIGS += $(FISH_CONFIGS)
CONFIGS += $(GENERAL_CONFIGS)
CONFIGS += $(GIT_CONFIGS)
CONFIGS += $(KITTY_CONFIGS)
CONFIGS += $(NEOVIM_CONFIGS)

install: $(CONFIGS)

uninstall:
	rm -f $(BSPWM_CONFIGS)
	rm -f $(DUNST_CONFIGS)
	rm -f $(FISH_CONFIGS)
	rm -f $(GENERAL_CONFIGS)
	rm -f $(GIT_CONFIGS)
	rm -f $(KITTY_CONFIGS)
	rm -f $(NEOVIM_CONFIGS)
