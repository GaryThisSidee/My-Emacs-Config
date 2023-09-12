(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set up the visible-bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "FiraCode" :height 180)

(load-theme 'wombat)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package swiper :ensure
        :config
        (global-set-key (kbd "C-s") 'swiper))

(use-package counsel :ensure
        :config
        (global-set-key (kbd "M-x") 'counsel-M-x)
        (global-set-key (kbd "s-y") 'counsel-yank-pop)
        (global-set-key (kbd "C-x C-f") 'counsel-find-file)) 

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package nyan-mode
  :ensure t
  :hook (doom-modeline-mode . nyan-mode)
  :config
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t)
)

