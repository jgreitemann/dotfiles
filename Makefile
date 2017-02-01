CP=cp
DOTVIM=$(HOME)/.vim
DOTVIMRC=$(HOME)/.vimrc
TMUXCONF=$(HOME)/.tmux.conf
EMACSDIR=$(HOME)/.emacs.d
DOTSPACEMACS=$(HOME)/.spacemacs

.PHONY: vim tmux spacemacs-install PluginInstall

all: vim tmux $(DOTSPACEMACS)

vim: $(DOTVIMRC) $(DOTVIM)/bundle/Vundle.vim PluginInstall

tmux: $(TMUXCONF)

$(DOTVIM):
	mkdir -p $(DOTVIM)

$(DOTVIMRC): $(DOTVIM) .vimrc
	mkdir -p $(DOTVIM)/backup
	mkdir -p $(DOTVIM)/swap
	mkdir -p $(DOTVIM)/undo
	$(CP) .vimrc $(DOTVIMRC)

$(DOTVIM)/bundle: $(DOTVIM)
	mkdir -p $(DOTVIM)/bundle

$(DOTVIM)/bundle/Vundle.vim: $(DOTVIM)/bundle
	if [ -d $(DOTVIM)/bundle/Vundle.vim ]; then \
		cd $(DOTVIM)/bundle/Vundle.vim; \
		git pull; \
	else \
		git clone https://github.com/VundleVim/Vundle.vim.git \
			    $(DOTVIM)/bundle/Vundle.vim; \
	fi

PluginInstall:
	vim +PluginInstall +qall


$(TMUXCONF): .tmux.conf
	$(CP) .tmux.conf $(TMUXCONF)

spacemacs-install:
	rm -rf $(EMACSDIR)
	git clone https://github.com/syl20bnr/spacemacs $(EMACSDIR)

$(DOTSPACEMACS): .spacemacs
	$(CP) .spacemacs $(DOTSPACEMACS)
