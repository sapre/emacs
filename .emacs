(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
  
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
;; no :pin needed, as package.el will choose the version in melpa


(use-package helm
  :ensure t
  :config
  (helm-mode 1))
;; Why is helm not on in everything like file searching ? 

(use-package ace-jump-mode
  :ensure t
  :commands ace-jump-mode
  :init
  (bind-key "C-SPC" 'ace-jump-mode))

;;If you use evil
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-numbers
  :ensure t)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "<kp-add>") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "<kp-subtract>") 'evil-numbers/dec-at-pt)

(use-package evil-visualstar
  :ensure t
  :config
  (global-evil-visualstar-mode 1))

(use-package magit
  :ensure t
  :pin melpa-stable)
;; we want stable magit package, and not the bleeding edge. 

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))
 ;; Need to make keywords bolded for easier reading.

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono for Powerline-10" ))
(set-face-attribute 'default t :font "DejaVu Sans Mono for Powerline-10" )

;; The following works, but overrides the theme/color scheme which is not acceptable
;;(setq font-lock-function-name-face 'bold)
;;(setq font-lock-comment-face       'default)
;;(setq font-lock-string-face        'default)
;;(setq font-lock-doc-string-face    'default)
;;(setq font-lock-keyword-face       'bold)
;;(setq font-lock-type-face          'default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; The following doesnt work, need to figure out how to make it work.
 ;; I want keywords to be bolded 
 ;;'(font-lock-keyword-face ((t (:bold t))))
 )


