;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(auto-completion
     c-c++
     clojure
     command-log
     emacs-lisp
     git
     helm
     treemacs
     html
     javascript
     (java :variables java-backend 'meghanada)
     yaml
     python
     markdown
     org
     search-engine
     parinfer
     syntax-checking
     themes-megapack
     version-control
     latex
     erc
     haskell
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     (shell :variables
            shell-default-shell 'eshell))

   dotspacemacs-additional-packages '(gist doom-themes rjsx-mode prettier-js ox-gfm)
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
   dotspacemacs-startup-lists '((todos . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(doom-dracula)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Fira Mono"
                               :size 12
                               :weight normal
                               :width normal
                               :antialias t
                               :powerline-scale 1.3)
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
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state t
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
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup t))

(defun dotspacemacs/user-init ())

(defun dotspacemacs/user-config ()
  ;; org
  (setq org-directory "~/Dropbox/org")
  (setq org-agenda-files (list org-directory))
  (setq org-capture-templates
        `(("j" "Journal" entry
           (file+olp+datetree "journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("l" "links")
          ("lo" "others" item
           (file+olp "notes.org" "Links" "Others"))
          ("lw" "work" item
           (file+olp "notes.org" "Links" "Work"))
          ("t" "thought" item
           (file+headline "notes.org" "Thoughts"))
          ("q" "question" item
           (file+headline "notes.org" "Questions"))))

  (setq magit-repository-directories
        '(("~/wp" . 1)))

  ;; custom keybindings
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-normal-state-map "K" 'evil-jump-out-args)

  (global-set-key (kbd "M-h") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "M-j") 'eyebrowse-switch-to-window-config-2)
  (global-set-key (kbd "M-k") 'eyebrowse-switch-to-window-config-3)
  (global-set-key (kbd "M-l") 'eyebrowse-switch-to-window-config-4)

  (define-global-minor-mode my-global-centered-cursor-mode centered-cursor-mode
    (lambda ()
      (when (not (memq major-mode
                       (list 'Info-mode 'term-mode 'eshell-mode 'shell-mode 'erc-mode 'inferior-emacs-lisp-mode)))
        (centered-cursor-mode))))
  (my-global-centered-cursor-mode 1)

  ;; matchit
  (defun evilmi-customize-keybinding ()
    (evil-define-key 'normal evil-matchit-mode-map
      "m" 'evilmi-jump-items))
  (global-evil-matchit-mode 1)

  ;; clojure
  clojure-enable-fancify-symbols t

  ;; exec path
  (setq exec-path (append exec-path (list (concat user-home-directory ".local/bin")))))


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
    (intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode org-mime exotica-theme company-auctex auctex-latexmk auctex yapfify yaml-mode pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic org-category-capture evil-snipe ghub let-alist engine-mode doom-themes all-the-icons memoize font-lock+ doom-peacock-theme company-emacs-eclim eclim rjsx-mode prettier-js mmm-mode markdown-toc markdown-mode gh-md command-log-mode doom-vibrant-theme sayid impatient-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc helm-css-scss haml-mode emmet-mode company-web web-completion-data company-tern tern coffee-mode ranger parinfer flycheck-clojure clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode org-projectile org-present org-pomodoro org-download htmlize gnuplot gist gh marshal logito pcache helm-w3m w3m slack circe oauth2 websocket emojify ht emoji-cheat-sheet-plus company-emoji alert log4e gntp white-sand-theme symon string-inflection rebecca-theme realgud test-simple loc-changes load-relative password-generator helm-purpose window-purpose imenu-list evil-lion editorconfig browse-at-remote ag xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help xbm-life erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks disaster cmake-mode clang-format smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter diff-hl flycheck-pos-tip pos-tip flycheck zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme helm-company helm-c-yasnippet fuzzy company-statistics company-c-headers company auto-yasnippet yasnippet ac-ispell auto-complete typit mmt sudoku pacmacs dash-functional 2048-game ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
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
    (yasnippet-snippets treemacs-projectile treemacs-evil treemacs pfuture spaceline-all-the-icons pippel pipenv overseer org-brain nameless mvn meghanada maven-test-mode importmagic epc ctable concurrent deferred helm-xref helm-rtags groovy-mode groovy-imports gradle-mode google-c-style flycheck-rtags evil-org evil-cleverparens ensime sbt-mode scala-mode dante lcr counsel-projectile counsel swiper ivy company-rtags rtags clojure-cheatsheet centered-cursor-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode org-mime exotica-theme company-auctex auctex-latexmk auctex yapfify yaml-mode pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic org-category-capture evil-snipe ghub let-alist engine-mode doom-themes all-the-icons memoize font-lock+ doom-peacock-theme company-emacs-eclim eclim rjsx-mode prettier-js mmm-mode markdown-toc markdown-mode gh-md command-log-mode doom-vibrant-theme sayid impatient-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc helm-css-scss haml-mode emmet-mode company-web web-completion-data company-tern tern coffee-mode ranger parinfer flycheck-clojure clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode org-projectile org-present org-pomodoro org-download htmlize gnuplot gist gh marshal logito pcache helm-w3m w3m slack circe oauth2 websocket emojify ht emoji-cheat-sheet-plus company-emoji alert log4e gntp white-sand-theme symon string-inflection rebecca-theme realgud test-simple loc-changes load-relative password-generator helm-purpose window-purpose imenu-list evil-lion editorconfig browse-at-remote ag xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help xbm-life erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks disaster cmake-mode clang-format smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter diff-hl flycheck-pos-tip pos-tip flycheck zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme helm-company helm-c-yasnippet fuzzy company-statistics company-c-headers company auto-yasnippet yasnippet ac-ispell auto-complete typit mmt sudoku pacmacs dash-functional 2048-game ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)








