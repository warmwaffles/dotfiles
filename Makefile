CWD=$(shell pwd)

all: install

# Please keep this in alphabetical order. It makes life easier.
CONFIGS = \
	$(HOME)/.clang-format \
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
