;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(markdown
     helm
     html
     version-control
     git
     emacs-lisp
     themes-megapack
     auto-completion
     syntax-checking
     clojure
     parinfer
     theming
     command-log
     javascript
     (shell :variables
            shell-default-shell 'eshell
            shell-default-position 'right
            shell-default-term-shell "/bin/mksh"
            shell-default-height 10))

   dotspacemacs-additional-packages '(gist doom-themes rjsx-mode prettier-js)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t

   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(doom-one)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 12
                               :weight normal
                               :width condensed
                               :antialias t
                               :powerline-scale 1.2)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key "\\"
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Home"
   dotspacemacs-display-default-layout t
   dotspacemacs-auto-resume-layouts t
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 100
   dotspacemacs-inactive-transparency 100
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup t))

(defun dotspacemacs/user-init ()
  (setq configuration-layer--elpa-archives
        '(("melpa" . "~/.elpa/melpa")
          ("org"   . "~/.elpa/org")
          ("gnu"   .  "~/.elpa/gnu")))
  (setq load-path (append load-path '("~/.spacemacs.d/42")))
  (load "header.el")
  (load "auto.el")
  (c-add-style "42"
               '((c-basic-offset . 4)
                 (tab-width . 4)
                 (fill-column . 80)
                 (indent-tabs-mode . t)
                 (c-hanging-braces-alist
                  (brace-list-open)
                  (brace-entry-open)
                  (substatement-open after)
                  (block-close . c-snug-do-while))
                 (c-cleanup-list brace-else-brace)
                 (c-offsets-alist
                  (topmost-intro-cont . +)
                  (statement-block-intro . +)
                  (arglist-cont-nonempty . +)
                  (knr-argdecl-intro . 0)
                  (substatement-open . 0)
                  (substatement-label . 0)
                  (label . 0)
                  (statement-cont . 0))))
  (push '(c-mode . "42") c-default-style)
  (add-hook 'term-exec-hook
            (function
             (lambda ()
               (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)))))

(defun dotspacemacs/user-config ()
  (set-terminal-parameter nil 'background-mode 'dark)
  (set-frame-parameter nil 'background-mode 'dark)
  (spacemacs/load-theme 'doom-one)

  evil-escape-key-sequence "fd"
  evil-escape-unordered-key-sequence t
  powerline-default-separator 'alternate
  ;; toggles
  (spacemacs/toggle-golden-ratio-on)
  (setq golden-ratio--value 0.8)
  (spacemacs/toggle-centered-point-globally-on)
  (spacemacs/toggle-automatic-symbol-highlight-on)
  (spacemacs/toggle-vi-tilde-fringe-off)
  (spaceline-toggle-evil-state-off)
  (spaceline-toggle-buffer-id-on)
  (spaceline-toggle-buffer-encoding-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-buffer-modified-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-purpose-off)
  (spaceline-toggle-buffer-position-on)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-line-column-on)
  (linum-relative-global-mode)

  ;; custom keybindings
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-normal-state-map "K" 'evil-jump-out-args)

  ;; matchit
  (defun evilmi-customize-keybinding ()
    (evil-define-key 'normal evil-matchit-mode-map
      "m" 'evilmi-jump-items))
  (global-evil-matchit-mode 1)

  ;; js
  (setq prettier-js-args '("--bracket-spacing" "false"
                           "--trailing-comma" "none"
                           "--print-width" "70"
                           "--use-tabs" "true"))
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'flycheck-mode)
  (add-hook 'rjsx-mode-hook (lambda () (setq-default
                                        js2-basic-offset 2
                                        web-mode-code-indent-offset 2)))

  (setf (alist-get "\\.js\\'" auto-mode-alist) 'rjsx-mode)
  (add-to-list 'auto-mode-alist
               '("\\.jsx\\'" . rjsx-mode))
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode)

  ;; clojure stuff
  (setq cider-cljs-lein-repl
        "(do (require 'figwheel-sidecar.repl-api)
         (figwheel-sidecar.repl-api/start-figwheel!)
         (figwheel-sidecar.repl-api/cljs-repl))")
  clojure-enable-fancify-symbols t)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   (quote
    (doom-vibrant-theme sayid impatient-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc helm-css-scss haml-mode emmet-mode company-web web-completion-data company-tern tern coffee-mode ranger parinfer flycheck-clojure clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode org-projectile org-present org-pomodoro org-download htmlize gnuplot gist gh marshal logito pcache helm-w3m w3m slack circe oauth2 websocket emojify ht emoji-cheat-sheet-plus company-emoji alert log4e gntp white-sand-theme symon string-inflection rebecca-theme realgud test-simple loc-changes load-relative password-generator helm-purpose window-purpose imenu-list evil-lion editorconfig browse-at-remote ag xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help xbm-life erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks disaster cmake-mode clang-format smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter diff-hl flycheck-pos-tip pos-tip flycheck zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme helm-company helm-c-yasnippet fuzzy company-statistics company-c-headers company auto-yasnippet yasnippet ac-ispell auto-complete typit mmt sudoku pacmacs dash-functional 2048-game ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#f8f8f8" :background "#26292c")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   (quote
    (exotica-theme nodejs-repl prettier-js company-sourcekit rjsx-mode mmm-mode markdown-toc markdown-mode gh-md command-log-mode doom-themes all-the-icons memoize font-lock+ sayid impatient-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc helm-css-scss haml-mode emmet-mode company-web web-completion-data company-tern tern coffee-mode ranger parinfer flycheck-clojure clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode org-projectile org-present org-pomodoro org-download htmlize gnuplot gist gh marshal logito pcache helm-w3m w3m slack circe oauth2 websocket emojify ht emoji-cheat-sheet-plus company-emoji alert log4e gntp white-sand-theme symon string-inflection rebecca-theme realgud test-simple loc-changes load-relative password-generator helm-purpose window-purpose imenu-list evil-lion editorconfig browse-at-remote ag xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help xbm-life erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks disaster cmake-mode clang-format smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter diff-hl flycheck-pos-tip pos-tip flycheck zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme helm-company helm-c-yasnippet fuzzy company-statistics company-c-headers company auto-yasnippet yasnippet ac-ispell auto-complete typit mmt sudoku pacmacs dash-functional 2048-game ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(prettier-js-args (quote ("--strip-trailing-cr")))
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(do (user/go) (user/cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#f8f8f8" :background "#26292c"))))
 '(ahs-face ((t (:background "#26292c" :foreground "#db208a"))))
 '(ahs-plugin-whole-buffer-face ((t (:background "#26292c" :foreground "#db208a" :underline t))))
 '(font-lock-string-face ((t (:foreground "#e38837"))))
 '(powerline-active1 ((t (:background "#5984b8" :foreground "#ffffff"))))
 '(powerline-inactive1 ((t (:foreground "#95abdb"))))
 '(powerline-inactive2 ((t (:background "#2a2e38"))))
 '(spacemacs-insert-face ((t (:background "#e38837"))))
 '(spacemacs-normal-face ((t (:background "#39438a")))))
)






