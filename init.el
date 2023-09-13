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
  :init (nyan-mode 1)
  :ensure t
  :hook (doom-modeline-mode . nyan-mode)
  :config
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t)
  )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init (ivy-rich-mode 1))
	 
(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;;:ensure t
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;;:custom
    ;;(corfu-auto )                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `global-corfu-modes'.
  :init
   (global-corfu-mode 1))

;; Enable auto completion and configure quitting
(setq corfu-auto 0.3
      corfu-quit-no-match 'separator);; or t

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

             
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-laserwave t))


