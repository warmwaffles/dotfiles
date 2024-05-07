CWD=$(shell pwd)

all: install

# Please keep this in alphabetical order. It makes life easier.
CONFIGS = \
	$(HOME)/.clang-format \
	$(HOME)/.config \
	$(HOME)/.config/bspwm \
	$(HOME)/.config/bspwm/bspwmrc \
	$(HOME)/.config/bspwm/polybar \
	$(HOME)/.config/bspwm/polybar/config.ini \
	$(HOME)/.config/bspwm/polybar/reload.sh \
	$(HOME)/.config/bspwm/reload.sh \
	$(HOME)/.config/bspwm/sxhkd \
	$(HOME)/.config/bspwm/sxhkd/launch.sh \
	$(HOME)/.config/bspwm/sxhkd/reload.sh \
	$(HOME)/.config/bspwm/sxhkd/sxhkdrc \
	$(HOME)/.config/dunst/colortest \
	$(HOME)/.config/dunst/dunstrc \
	$(HOME)/.config/fish/config.fish \
	$(HOME)/.dircolors \
	$(HOME)/.editorconfig \
	$(HOME)/.gitattributes \
	$(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.lldbinit \
	$(HOME)/.psqlrc \
	$(HOME)/.tool-versions \
	$(HOME)/.vimrc

install: $(CONFIGS)

uninstall:
	rm -f $(HOME)/.clang-format
	rm -f $(HOME)/.config/bspwm/bspwmrc
	rm -f $(HOME)/.config/bspwm/polybar/config.ini
	rm -f $(HOME)/.config/bspwm/polybar/reload.sh
	rm -f $(HOME)/.config/bspwm/reload.sh
	rm -f $(HOME)/.config/bspwm/reload.sh
	rm -f $(HOME)/.config/bspwm/sxhkd/launch.sh
	rm -f $(HOME)/.config/bspwm/sxhkd/reload.sh
	rm -f $(HOME)/.config/bspwm/sxhkd/sxhkdrc
	rm -f $(HOME)/.config/dunst/colortest
	rm -f $(HOME)/.config/dunst/dunstrc
	rm -f $(HOME)/.config/fish/config.fish
	rm -f $(HOME)/.dircolors
	rm -f $(HOME)/.editorconfig
	rm -f $(HOME)/.gitattributes
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.gitignore
	rm -f $(HOME)/.lldbinit
	rm -f $(HOME)/.psqlrc
	rm -f $(HOME)/.tool-versions
	rm -f $(HOME)/.vimrc

$(HOME)/.dircolors:
	ln -sf $(CWD)/dircolors $@

$(HOME)/.clang-format:
	ln -sf $(CWD)/clang-format $@

$(HOME)/.editorconfig:
	ln -sf $(CWD)/editorconfig $@

$(HOME)/.gitattributes:
	ln -sf $(CWD)/gitattributes $@

$(HOME)/.gitconfig:
	ln -sf $(CWD)/gitconfig $@

$(HOME)/.gitignore:
	ln -sf $(CWD)/gitignore $@

$(HOME)/.lldbinit:
	ln -sf $(CWD)/lldbinit $@

$(HOME)/.psqlrc:
	ln -sf $(CWD)/psqlrc $@

$(HOME)/.tool-versions:
	ln -sf $(CWD)/tool-versions $@

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

$(HOME)/.config/bspwm/polybar/config.ini: $(HOME)/.config/bspwm/polybar
	ln -sf $(CWD)/bspwm/polybar/config.ini $@

$(HOME)/.config/bspwm/polybar/reload.sh: $(HOME)/.config/bspwm/polybar
	ln -sf $(CWD)/bspwm/polybar/reload.sh $@

$(HOME)/.config/bspwm/sxhkd/launch.sh: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/sxhkd/launch.sh $@

$(HOME)/.config/bspwm/sxhkd/reload.sh: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/sxhkd/reload.sh $@

$(HOME)/.config/bspwm/sxhkd/sxhkdrc: $(HOME)/.config/bspwm/sxhkd
	ln -sf $(CWD)/bspwm/sxhkd/sxhkdrc $@

$(HOME)/.config/bspwm/bspwmrc: $(HOME)/.config/bspwm
	ln -sf $(CWD)/bspwm/bspwmrc $@

$(HOME)/.config/bspwm/reload.sh: $(HOME)/.config/bspwm
	ln -sf $(CWD)/bspwm/reload.sh $@

#
# Fish
#

$(HOME)/.config/fish:
	mkdir -p $@

$(HOME)/.config/fish/config.fish: $(HOME)/.config/fish
	ln -sf $(CWD)/fish/config.fish $@

#
# Dunst
#

$(HOME)/.config/dunst:
	mkdir -p $@

$(HOME)/.config/dunst/dunstrc: $(HOME)/.config/dunst
	ln -sf $(CWD)/dunst/dunstrc $@

$(HOME)/.config/dunst/colortest: $(HOME)/.config/dunst
	ln -sf $(CWD)/dunst/colortest $@
