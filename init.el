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

(set-face-attribute 'default nil :font "Fira Code" :height 180)

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

;; add line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers in some mode
(dolist (mode `(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; gives suggestion in more detail
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

;; basically like a grep
(use-package swiper :ensure
        :config
        (global-set-key (kbd "C-s") 'swiper))

;; counsel install
(use-package counsel :ensure
     :config
        (global-set-key (kbd "M-x") 'counsel-M-x)
        (global-set-key (kbd "s-y") 'counsel-yank-pop)
        (global-set-key (kbd "C-x C-f") 'counsel-find-file))

;; mode line 
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; nyan cat
(use-package nyan-mode
  :init (nyan-mode 1)
  :ensure t
  :hook (doom-modeline-mode . nyan-mode)
  :config
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t)
  )

;; highlights paranthesis etc
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; help with keys
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; put extra details 
(use-package ivy-rich
  :init (ivy-rich-mode 1))

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

;; Auto completion 
(use-package corfu
  :init
    (global-corfu-mode 1))

;; Enable auto completion and configure quitting
(setq corfu-auto 0.3
      corfu-quit-no-match 'separator);; or t

;; More better describe function and variabels
(use-package helpful
  :ensure t
    :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap descibe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))

 ;; doom themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-laserwave t))

;; install all the icons
(use-package all-the-icons)



       
