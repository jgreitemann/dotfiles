; Install packages if not installed already

; list the packages you want
(setq package-list '(evil evil-surround centered-cursor-mode linum-relative hl-line magit flatland-theme))

; list the repositories containing them
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;---------------------------------

; My setup
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)

(show-paren-mode 1)

(add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
(set-face-attribute 'default t :font "Source Code Pro-11")

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'flatland-theme)
(load-theme 'flatland t)

(require 'centered-cursor-mode)
(global-centered-cursor-mode +1)

(require 'linum-relative)
(linum-relative-global-mode 1)

(require 'hl-line)
(set-face-background hl-line-face "#373b40")
(global-hl-line-mode 1)

(require 'magit)

; Use powerline from github.com/Dewdrops/powerline
(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(require 'powerline)
(powerline-evil-theme)
