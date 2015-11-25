CP=cp
DOTVIM=$(HOME)/.vim
DOTVIMRC=$(HOME)/.vimrc

.PHONY: Vundle

all: $(DOTVIMRC)

$(DOTVIM):
	mkdir -p $(DOTVIM)

$(DOTVIMRC): $(DOTVIM) .vimrc
	mkdir -p $(DOTVIM)/backup
	mkdir -p $(DOTVIM)/swap
	mkdir -p $(DOTVIM)/undo
	$(CP) .vimrc $(DOTVIMRC)
	vim +PluginInstall +qall

Vundle: $(DOTVIM)
	mkdir -p $(DOTVIM)/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git $(DOTVIM)/bundle/Vundle.vim

