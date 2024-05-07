CWD=$(shell pwd)

all: install

# Please keep this in alphabetical order. It makes life easier.
CONFIGS = \
	$(HOME)/.clang-format \
	$(HOME)/.config/bspwm \
	$(HOME)/.config/bspwm/bspwmrc \
	$(HOME)/.config/bspwm/polybar/config.ini \
	$(HOME)/.config/bspwm/polybar/reload.sh \
	$(HOME)/.config/bspwm/reload.sh \
	$(HOME)/.config/bspwm/sxhkd/launch.sh \
	$(HOME)/.config/bspwm/sxhkd/reload.sh \
	$(HOME)/.config/bspwm/sxhkd/sxhkdrc \
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
	ln -s $(CWD)/dircolors $@

$(HOME)/.clang-format:
	ln -s $(CWD)/clang-format $@

$(HOME)/.editorconfig:
	ln -s $(CWD)/editorconfig $@

$(HOME)/.gitattributes:
	ln -s $(CWD)/gitattributes $@

$(HOME)/.gitconfig:
	ln -s $(CWD)/gitconfig $@

$(HOME)/.gitignore:
	ln -s $(CWD)/gitignore $@

$(HOME)/.lldbinit:
	ln -s $(CWD)/lldbinit $@

$(HOME)/.psqlrc:
	ln -s $(CWD)/psqlrc $@

$(HOME)/.tool-versions:
	ln -s $(CWD)/tool-versions $@

$(HOME)/.vimrc:
	ln -s $(CWD)/vimrc $@

$(HOME)/.config:
	mkdir -p $@

#
# BSPWM
#

$(HOME)/.config/bspwm: $(HOME)/.config
	mkdir -p $@

$(HOME)/.config/bspwm/polybar: $(HOME)/.config/bspwm
	mkdir -p $@

$(HOME)/.config/bspwm/sxhkd: $(HOME)/.config/bspwm
	mkdir -p $@

$(HOME)/.config/bspwm/polybar/config.ini: $(HOME)/.config/bspwm/polybar
	ln -s $(CWD)/bspwm/polybar/config.ini $@

$(HOME)/.config/bspwm/polybar/reload.sh: $(HOME)/.config/bspwm/polybar
	ln -s $(CWD)/bspwm/polybar/reload.sh $@

$(HOME)/.config/bspwm/sxhkd/launch.sh: $(HOME)/.config/bspwm/sxhkd
	ln -s $(CWD)/bspwm/sxhkd/launch.sh $@

$(HOME)/.config/bspwm/sxhkd/reload.sh: $(HOME)/.config/bspwm/sxhkd
	ln -s $(CWD)/bspwm/sxhkd/reload.sh $@

$(HOME)/.config/bspwm/sxhkd/sxhkdrc: $(HOME)/.config/bspwm/sxhkd
	ln -s $(CWD)/bspwm/sxhkd/sxhkdrc $@

$(HOME)/.config/bspwm/bspwmrc: $(HOME)/.config/bspwm
	ln -s $(CWD)/bspwm/bspwmrc $@

$(HOME)/.config/bspwm/reload.sh: $(HOME)/.config/bspwm
	ln -s $(CWD)/bspwm/reload.sh $@
