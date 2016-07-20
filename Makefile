CP=cp
DOTVIM=$(HOME)/.vim
DOTVIMRC=$(HOME)/.vimrc
TMUXCONF=$(HOME)/.tmux.conf
EMACSDIR=$(HOME)/.emacs.d

.PHONY: vim tmux emacs PluginInstall

all: vim tmux emacs

vim: $(DOTVIMRC) $(DOTVIM)/bundle/Vundle.vim PluginInstall

tmux: $(TMUXCONF)

emacs: $(EMACSDIR)/init.el $(EMACSDIR)/backup $(EMACSDIR)/vendor/powerline

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

$(EMACSDIR):
	mkdir -p $(EMACSDIR)

$(EMACSDIR)/init.el: $(EMACSDIR) .emacs.d/init.el
	$(CP) .emacs.d/init.el $(EMACSDIR)/init.el

$(EMACSDIR)/vendor: $(EMACSDIR)
	mkdir -p $(EMACSDIR)/vendor

$(EMACSDIR)/backup: $(EMACSDIR)
	mkdir -p $(EMACSDIR)/backup

$(EMACSDIR)/vendor/powerline: $(EMACSDIR)/vendor
	if [ -d $(EMACSDIR)/vendor/powerline ]; then \
		cd $(EMACSDIR)/vendor/powerline; \
		git pull; \
	else \
		git clone https://github.com/Dewdrops/powerline.git \
			    $(EMACSDIR)/vendor/powerline; \
	fi

