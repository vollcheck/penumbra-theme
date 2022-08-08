;;; penumbra-theme.el --- Penumbra Theme

;; Copyright 2022-present, All rights reserved
;;
;; Code licensed under the MIT license

;; Maintainer: vollcheck <j3k.walczak@gmail.com>
;; Author: vollcheck
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/vollcheck/penumbra-theme

;;; Commentary:

;; Specification is taken from https://github.com/nealmckee/penumbra.

;;; Code:
(deftheme penumbra)


;;;; Configuration options:

(defgroup penumbra nil
  "Penumbra theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom penumbra-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'penumbra)

(defcustom penumbra-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'penumbra)

(defcustom penumbra-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'penumbra)

(defcustom penumbra-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'penumbra)

(defcustom penumbra-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'penumbra)

(defcustom penumbra-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'penumbra)

(defvar penumbra-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
Penumbra theme:

    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))

There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/penumbra/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (penumbra-bg      "#282a36" "unspecified-bg" "unspecified-bg") ; official background
                (penumbra-fg      "#f8f8f2" "#ffffff" "brightwhite")           ; official foreground
                (penumbra-current "#44475a" "#303030" "brightblack")           ; official current-line/selection
                (penumbra-comment "#6272a4" "#5f5faf" "blue")                  ; official comment
                (penumbra-cyan    "#8be9fd" "#87d7ff" "brightcyan")            ; official cyan
                (penumbra-green   "#50fa7b" "#5fff87" "green")                 ; official green
                (penumbra-orange  "#ffb86c" "#ffaf5f" "brightred")             ; official orange
                (penumbra-pink    "#ff79c6" "#ff87d7" "magenta")               ; official pink
                (penumbra-purple  "#bd93f9" "#af87ff" "brightmagenta")         ; official purple
                (penumbra-red     "#ff5555" "#ff8787" "red")                   ; official red
                (penumbra-yellow  "#f1fa8c" "#ffff87" "yellow")                ; official yellow
                ;; Other colors
                (bg2             "#373844" "#121212" "brightblack")
                (bg3             "#464752" "#262626" "brightblack")
                (bg4             "#565761" "#444444" "brightblack")
                (fg2             "#e2e2dc" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (other-blue      "#0189cc" "#0087ff" "brightblue")))
      (faces '(;; default / basic faces
               (cursor :background ,fg3)
               (default :background ,penumbra-bg :foreground ,penumbra-fg)
               (default-italic :slant italic)
               (error :foreground ,penumbra-red)
               (ffap :foreground ,fg4)
               (fringe :background ,penumbra-bg :foreground ,fg4)
               (header-line :background ,penumbra-bg)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,penumbra-current :extend t)
               (info-quoted-name :foreground ,penumbra-orange)
               (info-string :foreground ,penumbra-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,penumbra-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,penumbra-bg)
               (line-number :slant italic :foreground ,bg4 :background ,penumbra-bg)
               (match :background ,penumbra-yellow :foreground ,penumbra-bg)
               (menu :background ,penumbra-current :inverse-video nil
                     ,@(if penumbra-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground penumbra-fg)))
               (minibuffer-prompt
                ,@(if penumbra-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground penumbra-fg)
                    (list :weight 'bold :foreground penumbra-pink)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (shadow :foreground ,penumbra-comment)
               (success :foreground ,penumbra-green)
               (tooltip :foreground ,penumbra-fg :background ,penumbra-current)
               (trailing-whitespace :background ,penumbra-orange)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,penumbra-orange)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,penumbra-cyan :slant italic)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,penumbra-purple)
               (font-lock-doc-face :foreground ,penumbra-comment)
               (font-lock-function-name-face :foreground ,penumbra-green :weight bold)
               (font-lock-keyword-face :foreground ,penumbra-pink :weight bold)
               (font-lock-negation-char-face :foreground ,penumbra-cyan)
               (font-lock-preprocessor-face :foreground ,penumbra-orange)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,penumbra-cyan)
               (font-lock-regexp-grouping-construct :foreground ,penumbra-purple)
               (font-lock-string-face :foreground ,penumbra-yellow)
               (font-lock-type-face :inherit font-lock-builtin-face)
               (font-lock-variable-name-face :foreground ,penumbra-fg :weight bold)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,penumbra-pink)
               ;; company
               (company-echo-common :foreground ,penumbra-bg :background ,penumbra-fg)
               (company-preview :background ,penumbra-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,penumbra-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,penumbra-green)
               (company-scrollbar-bg :background ,penumbra-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,penumbra-green
                                       :underline t)
               (company-tooltip-search-selection :background ,penumbra-green
                                                 :foreground ,penumbra-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,penumbra-bg)
               (company-tooltip-common :foreground ,penumbra-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,penumbra-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,penumbra-green)
               (completions-first-difference :foreground ,penumbra-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,penumbra-orange :background ,penumbra-orange)
               (diff-hl-delete :foreground ,penumbra-red :background ,penumbra-red)
               (diff-hl-insert :foreground ,penumbra-green :background ,penumbra-green)
               ;; dired
               (dired-directory :foreground ,penumbra-green :weight normal)
               (dired-flagged :foreground ,penumbra-pink)
               (dired-header :foreground ,fg3 :background ,penumbra-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,penumbra-fg :weight bold)
               (dired-marked :foreground ,penumbra-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,penumbra-yellow :weight normal :slant italic)
               (dired-warning :foreground ,penumbra-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,penumbra-fg)
               (diredp-deletion-file-name :foreground ,penumbra-pink :background ,penumbra-current)
               (diredp-deletion :foreground ,penumbra-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,penumbra-orange)
               (diredp-file-name :foreground ,penumbra-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,penumbra-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,penumbra-current)
               (diredp-ignored-file-name :foreground ,penumbra-fg)
               (diredp-mode-line-flagged :foreground ,penumbra-orange)
               (diredp-mode-line-marked :foreground ,penumbra-orange)
               (diredp-no-priv :foreground ,penumbra-fg)
               (diredp-number :foreground ,penumbra-cyan)
               (diredp-other-priv :foreground ,penumbra-orange)
               (diredp-rare-priv :foreground ,penumbra-orange)
               (diredp-read-priv :foreground ,penumbra-purple)
               (diredp-write-priv :foreground ,penumbra-pink)
               (diredp-exec-priv :foreground ,penumbra-yellow)
               (diredp-symlink :foreground ,penumbra-orange)
               (diredp-link-priv :foreground ,penumbra-orange)
               (diredp-autofile-name :foreground ,penumbra-yellow)
               (diredp-tagged-autofile-name :foreground ,penumbra-yellow)
               ;; eldoc-box
               (eldoc-box-border :background ,penumbra-current)
               (eldoc-box-body :background ,penumbra-current)
               ;; elfeed
               (elfeed-search-date-face :foreground ,penumbra-comment)
               (elfeed-search-title-face :foreground ,penumbra-fg)
               (elfeed-search-unread-title-face :foreground ,penumbra-pink :weight bold)
               (elfeed-search-feed-face :foreground ,penumbra-fg :weight bold)
               (elfeed-search-tag-face :foreground ,penumbra-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,penumbra-pink)
               (elfeed-search-filter-face :foreground ,penumbra-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,penumbra-red)
               (elfeed-log-warn-level-face :foreground ,penumbra-orange)
               (elfeed-log-info-level-face :foreground ,penumbra-cyan)
               (elfeed-log-debug-level-face :foreground ,penumbra-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,penumbra-pink
                                       ,@(when penumbra-enlarge-headings
                                           (list :height penumbra-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,penumbra-purple
                                       ,@(when penumbra-enlarge-headings
                                           (list :height penumbra-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,penumbra-green
                                       ,@(when penumbra-enlarge-headings
                                           (list :height penumbra-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,penumbra-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,penumbra-yellow)
               (enh-ruby-op-face :foreground ,penumbra-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,penumbra-yellow)
               (enh-ruby-string-delimiter-face :foreground ,penumbra-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,penumbra-orange))
               (flyspell-incorrect :underline (:style wave :color ,penumbra-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,penumbra-purple)
               (font-latex-italic-face :foreground ,penumbra-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,penumbra-cyan)
               (font-latex-match-variable-keywords :foreground ,penumbra-fg)
               (font-latex-string-face :foreground ,penumbra-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,penumbra-pink
                                      ,@(when penumbra-enlarge-headings
                                          (list :height penumbra-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,penumbra-purple
                                      ,@(when penumbra-enlarge-headings
                                          (list :height penumbra-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,penumbra-green
                                      ,@(when penumbra-enlarge-headings
                                          (list :height penumbra-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,penumbra-yellow)
               (gemini-quote-face :foreground ,penumbra-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,penumbra-pink)
               (go-test--standard-face :foreground ,penumbra-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,penumbra-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,penumbra-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,penumbra-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,penumbra-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,penumbra-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,penumbra-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,penumbra-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,penumbra-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,penumbra-purple)
               (gnus-header-from :foreground ,penumbra-fg)
               (gnus-header-name :foreground ,penumbra-green)
               (gnus-header-subject :foreground ,penumbra-pink :weight bold)
               (gnus-summary-markup-face :foreground ,penumbra-cyan)
               (gnus-summary-high-unread :foreground ,penumbra-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,penumbra-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,penumbra-pink :weight bold)
               (gnus-summary-low-unread :foreground ,penumbra-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,penumbra-pink)
               (haskell-constructor-face :foreground ,penumbra-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,penumbra-purple)
               (helm-buffer-not-saved :foreground ,penumbra-purple :background ,penumbra-bg)
               (helm-buffer-process :foreground ,penumbra-orange :background ,penumbra-bg)
               (helm-buffer-saved-out :foreground ,penumbra-fg :background ,penumbra-bg)
               (helm-buffer-size :foreground ,penumbra-fg :background ,penumbra-bg)
               (helm-candidate-number :foreground ,penumbra-bg :background ,penumbra-fg)
               (helm-ff-directory :foreground ,penumbra-green :background ,penumbra-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,penumbra-green :background ,penumbra-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,penumbra-bg :weight normal)
               (helm-ff-file :foreground ,penumbra-fg :background ,penumbra-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,penumbra-pink :background ,penumbra-bg :weight bold)
               (helm-ff-prefix :foreground ,penumbra-bg :background ,penumbra-pink :weight normal)
               (helm-ff-symlink :foreground ,penumbra-pink :background ,penumbra-bg :weight bold)
               (helm-grep-cmd-line :foreground ,penumbra-fg :background ,penumbra-bg)
               (helm-grep-file :foreground ,penumbra-fg :background ,penumbra-bg)
               (helm-grep-finish :foreground ,fg2 :background ,penumbra-bg)
               (helm-grep-lineno :foreground ,penumbra-fg :background ,penumbra-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,penumbra-green :background ,penumbra-bg)
               (helm-header :foreground ,fg2 :background ,penumbra-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,penumbra-green :background ,penumbra-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,penumbra-purple :background ,penumbra-bg)
               (helm-source-go-package-godoc-description :foreground ,penumbra-yellow)
               (helm-source-header :foreground ,penumbra-pink :background ,penumbra-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,penumbra-orange :background ,penumbra-bg)
               (helm-time-zone-home :foreground ,penumbra-purple :background ,penumbra-bg)
               (helm-visible-mark :foreground ,penumbra-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,penumbra-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,penumbra-fg)
               (icicle-search-current-input :foreground ,penumbra-pink)
               (icicle-search-context-level-8 :foreground ,penumbra-orange)
               (icicle-search-context-level-7 :foreground ,penumbra-orange)
               (icicle-search-context-level-6 :foreground ,penumbra-orange)
               (icicle-search-context-level-5 :foreground ,penumbra-orange)
               (icicle-search-context-level-4 :foreground ,penumbra-orange)
               (icicle-search-context-level-3 :foreground ,penumbra-orange)
               (icicle-search-context-level-2 :foreground ,penumbra-orange)
               (icicle-search-context-level-1 :foreground ,penumbra-orange)
               (icicle-search-main-regexp-current :foreground ,penumbra-fg)
               (icicle-saved-candidate :foreground ,penumbra-fg)
               (icicle-proxy-candidate :foreground ,penumbra-fg)
               (icicle-mustmatch-completion :foreground ,penumbra-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,penumbra-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,penumbra-orange)
               (icicle-match-highlight-Completions :foreground ,penumbra-green)
               (icicle-key-complete-menu-local :foreground ,penumbra-fg)
               (icicle-key-complete-menu :foreground ,penumbra-fg)
               (icicle-input-completion-fail-lax :foreground ,penumbra-pink)
               (icicle-input-completion-fail :foreground ,penumbra-pink)
               (icicle-historical-candidate-other :foreground ,penumbra-fg)
               (icicle-historical-candidate :foreground ,penumbra-fg)
               (icicle-current-candidate-highlight :foreground ,penumbra-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,penumbra-fg)
               (icicle-complete-input :foreground ,penumbra-orange)
               (icicle-common-match-highlight-Completions :foreground ,penumbra-purple)
               (icicle-candidate-part :foreground ,penumbra-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,penumbra-orange)
               ;; ido
               (ido-first-match
                ,@(if penumbra-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground penumbra-green)
                    (list :weight 'bold :foreground penumbra-pink)))
               (ido-only-match :foreground ,penumbra-orange)
               (ido-subdir :foreground ,penumbra-yellow)
               (ido-virtual :foreground ,penumbra-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,penumbra-fg :background ,penumbra-pink)
               ;; ivy
               (ivy-current-match
                ,@(if penumbra-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :background penumbra-current :foreground penumbra-green)
                    (list :weight 'bold :background penumbra-current :foreground penumbra-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,penumbra-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,penumbra-green
                                            :foreground ,penumbra-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,penumbra-yellow
                                            :foreground ,penumbra-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,penumbra-pink
                                            :foreground ,penumbra-bg)
               (ivy-confirm-face :foreground ,penumbra-orange)
               (ivy-match-required-face :foreground ,penumbra-red)
               (ivy-subdir :foreground ,penumbra-yellow)
               (ivy-remote :foreground ,penumbra-pink)
               (ivy-virtual :foreground ,penumbra-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,penumbra-bg :background ,penumbra-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,penumbra-cyan)
               (jde-java-font-lock-modifier-face :foreground ,penumbra-pink)
               (jde-java-font-lock-number-face :foreground ,penumbra-fg)
               (jde-java-font-lock-package-face :foreground ,penumbra-fg)
               (jde-java-font-lock-private-face :foreground ,penumbra-pink)
               (jde-java-font-lock-public-face :foreground ,penumbra-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,penumbra-purple)
               (js2-function-param :foreground ,penumbra-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,penumbra-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,penumbra-yellow)
               (js2-private-function-call :foreground ,penumbra-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,penumbra-orange)
               (js3-external-variable-face :foreground ,penumbra-fg)
               (js3-function-param-face :foreground ,penumbra-pink)
               (js3-instance-member-face :foreground ,penumbra-cyan)
               (js3-jsdoc-tag-face :foreground ,penumbra-pink)
               (js3-warning-face :underline ,penumbra-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,penumbra-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,penumbra-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,penumbra-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,penumbra-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,penumbra-fg :weight ultra-bold
                                               :box (:line-width -1 :color penumbra-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,penumbra-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,penumbra-bg)
               (lsp-ui-doc-header :foreground ,penumbra-bg :background ,penumbra-cyan)
               ;; magit
               (magit-branch-local :foreground ,penumbra-cyan)
               (magit-branch-remote :foreground ,penumbra-green)
               (magit-tag :foreground ,penumbra-orange)
               (magit-section-heading :foreground ,penumbra-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,penumbra-orange
                                            :background ,penumbra-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,penumbra-orange
                                                      :background ,bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,penumbra-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,penumbra-green)
               (magit-diffstat-removed :foreground ,penumbra-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,penumbra-orange :weight bold)
               (magit-process-ok :foreground ,penumbra-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,penumbra-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,penumbra-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,penumbra-pink
                ,@(when penumbra-enlarge-headings
                    (list :height penumbra-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,penumbra-purple
                ,@(when penumbra-enlarge-headings
                    (list :height penumbra-height-title-2)))
               (markdown-header-face-3
                :foreground ,penumbra-green
                ,@(when penumbra-enlarge-headings
                    (list :height penumbra-height-title-3)))
               (markdown-header-face-4 :foreground ,penumbra-yellow)
               (markdown-header-face-5 :foreground ,penumbra-cyan)
               (markdown-header-face-6 :foreground ,penumbra-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,penumbra-fg)
               (markdown-inline-code-face :foreground ,penumbra-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,penumbra-orange)
               (markdown-table-face :foreground ,penumbra-purple)
               (markdown-list-face :foreground ,penumbra-cyan)
               (markdown-language-keyword-face :foreground ,penumbra-comment)
               ;; message
               (message-header-to :foreground ,penumbra-fg :weight bold)
               (message-header-cc :foreground ,penumbra-fg :bold bold)
               (message-header-subject :foreground ,penumbra-orange)
               (message-header-newsgroups :foreground ,penumbra-purple)
               (message-header-other :foreground ,penumbra-purple)
               (message-header-name :foreground ,penumbra-green)
               (message-header-xheader :foreground ,penumbra-cyan)
               (message-separator :foreground ,penumbra-cyan :slant italic)
               (message-cited-text :foreground ,penumbra-purple)
               (message-cited-text-1 :foreground ,penumbra-purple)
               (message-cited-text-2 :foreground ,penumbra-orange)
               (message-cited-text-3 :foreground ,penumbra-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,penumbra-green :weight normal)
               ;; mode-line
               (mode-line :background ,penumbra-current
                          :box ,penumbra-current :inverse-video nil
                          ,@(if penumbra-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground penumbra-fg)))
               (mode-line-inactive
                :background ,penumbra-bg :inverse-video nil
                ,@(if penumbra-alternate-mode-line-and-minibuffer
                      (list :foreground penumbra-comment :box penumbra-bg)
                    (list :foreground fg4 :box bg2)))
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,penumbra-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,penumbra-purple)
               (mu4e-highlight-face :background ,penumbra-bg
                                    :foreground ,penumbra-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,penumbra-current
                                           :foreground ,penumbra-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,penumbra-purple)
               (mu4e-cited-1-face :foreground ,penumbra-purple)
               (mu4e-cited-2-face :foreground ,penumbra-orange)
               (mu4e-cited-3-face :foreground ,penumbra-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,penumbra-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,penumbra-purple)
               (neo-expand-btn-face :foreground ,penumbra-fg)
               (neo-file-link-face :foreground ,penumbra-cyan)
               (neo-header-face :background ,penumbra-bg
                                :foreground ,penumbra-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,penumbra-purple :weight bold)
               (neo-vc-added-face :foreground ,penumbra-orange)
               (neo-vc-conflict-face :foreground ,penumbra-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,penumbra-orange)
               (neo-vc-ignored-face :foreground ,penumbra-comment)
               (neo-vc-missing-face :foreground ,penumbra-red)
               (neo-vc-needs-merge-face :foreground ,penumbra-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,penumbra-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,penumbra-green)
               (neo-vc-user-face :foreground ,penumbra-purple)
               ;; org
               (org-agenda-date :foreground ,penumbra-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,penumbra-comment)
               (org-agenda-done :foreground ,penumbra-green)
               (org-agenda-structure :foreground ,penumbra-purple)
               (org-block :foreground ,penumbra-orange)
               (org-code :foreground ,penumbra-green)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,penumbra-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,penumbra-comment)
               (org-document-title :weight bold :foreground ,penumbra-orange
                                   ,@(when penumbra-enlarge-headings
                                       (list :height penumbra-height-doc-title)))
               (org-done :foreground ,penumbra-green)
               (org-ellipsis :foreground ,penumbra-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,penumbra-pink)
               (org-headline-done :foreground ,penumbra-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,penumbra-bg :background ,penumbra-bg)
               (org-level-1 :inherit bold :foreground ,penumbra-pink
                            ,@(when penumbra-enlarge-headings
                                (list :height penumbra-height-title-1)))
               (org-level-2 :inherit bold :foreground ,penumbra-purple
                            ,@(when penumbra-enlarge-headings
                                (list :height penumbra-height-title-2)))
               (org-level-3 :weight normal :foreground ,penumbra-green
                            ,@(when penumbra-enlarge-headings
                                (list :height penumbra-height-title-3)))
               (org-level-4 :weight normal :foreground ,penumbra-yellow)
               (org-level-5 :weight normal :foreground ,penumbra-cyan)
               (org-level-6 :weight normal :foreground ,penumbra-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,penumbra-fg)
               (org-link :foreground ,penumbra-cyan :underline t)
               (org-priority :foreground ,penumbra-cyan)
               (org-quote :foreground ,penumbra-yellow :slant italic)
               (org-scheduled :foreground ,penumbra-green)
               (org-scheduled-previously :foreground ,penumbra-yellow)
               (org-scheduled-today :foreground ,penumbra-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,penumbra-yellow)
               (org-table :foreground ,penumbra-purple)
               (org-tag :foreground ,penumbra-pink :weight bold :background ,bg2)
               (org-todo :foreground ,penumbra-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,penumbra-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,penumbra-pink)
               ;; outline
               (outline-1 :foreground ,penumbra-pink)
               (outline-2 :foreground ,penumbra-purple)
               (outline-3 :foreground ,penumbra-green)
               (outline-4 :foreground ,penumbra-yellow)
               (outline-5 :foreground ,penumbra-cyan)
               (outline-6 :foreground ,penumbra-orange)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,penumbra-pink)
               ;; powerline
               (powerline-active1 :background ,penumbra-bg :foreground ,penumbra-pink)
               (powerline-active2 :background ,penumbra-bg :foreground ,penumbra-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,penumbra-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,penumbra-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,penumbra-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,penumbra-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,penumbra-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,penumbra-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,penumbra-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,penumbra-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,penumbra-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,penumbra-fg)
               (rainbow-delimiters-depth-2-face :foreground ,penumbra-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,penumbra-purple)
               (rainbow-delimiters-depth-4-face :foreground ,penumbra-pink)
               (rainbow-delimiters-depth-5-face :foreground ,penumbra-orange)
               (rainbow-delimiters-depth-6-face :foreground ,penumbra-green)
               (rainbow-delimiters-depth-7-face :foreground ,penumbra-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,penumbra-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,penumbra-green)
               (rpm-spec-doc-face :foreground ,penumbra-pink)
               (rpm-spec-ghost-face :foreground ,penumbra-purple)
               (rpm-spec-macro-face :foreground ,penumbra-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,penumbra-purple)
               (rpm-spec-section-face :foreground ,penumbra-yellow)
               (rpm-spec-tag-face :foreground ,penumbra-cyan)
               (rpm-spec-var-face :foreground ,penumbra-orange)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,penumbra-pink :weight bold)
               (rst-level-2 :foreground ,penumbra-purple :weight bold)
               (rst-level-3 :foreground ,penumbra-green)
               (rst-level-4 :foreground ,penumbra-yellow)
               (rst-level-5 :foreground ,penumbra-cyan)
               (rst-level-6 :foreground ,penumbra-orange)
               (rst-level-7 :foreground ,other-blue)
               (rst-level-8 :foreground ,penumbra-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,penumbra-pink)
               (selectrum-secondary-highlight :foreground ,penumbra-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,penumbra-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,penumbra-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,penumbra-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,penumbra-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,penumbra-green)
               (speedbar-file-face :foreground ,penumbra-cyan)
               (speedbar-directory-face :foreground ,penumbra-purple)
               (speedbar-tag-face :foreground ,penumbra-yellow)
               (speedbar-selected-face :foreground ,penumbra-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,penumbra-bg
                                        :foreground ,penumbra-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,penumbra-purple :background ,penumbra-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,penumbra-pink :background ,penumbra-bg
                            :box (:line-width 2 :color ,penumbra-bg :style nil))
               (tab-bar-tab-inactive :foreground ,penumbra-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,penumbra-purple :background ,penumbra-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,penumbra-pink :background ,penumbra-bg
                             :box (:line-width 2 :color ,penumbra-bg :style nil))
               (tab-line-tab-inactive :foreground ,penumbra-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,penumbra-red)
               ;; telephone-line
               (telephone-line-accent-active :background ,penumbra-bg :foreground ,penumbra-pink)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,penumbra-purple)
               (telephone-line-unimportant :background ,penumbra-bg :foreground ,penumbra-comment)
               ;; term
               (term :foreground ,penumbra-fg :background ,penumbra-bg)
               (term-color-black :foreground ,penumbra-bg :background ,penumbra-comment)
               (term-color-blue :foreground ,penumbra-purple :background ,penumbra-purple)
               (term-color-cyan :foreground ,penumbra-cyan :background ,penumbra-cyan)
               (term-color-green :foreground ,penumbra-green :background ,penumbra-green)
               (term-color-magenta :foreground ,penumbra-pink :background ,penumbra-pink)
               (term-color-red :foreground ,penumbra-red :background ,penumbra-red)
               (term-color-white :foreground ,penumbra-fg :background ,penumbra-fg)
               (term-color-yellow :foreground ,penumbra-yellow :background ,penumbra-yellow)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,penumbra-pink)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,penumbra-pink)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,penumbra-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,penumbra-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,penumbra-pink)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,penumbra-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,penumbra-pink)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,penumbra-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,penumbra-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,penumbra-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,penumbra-purple)
               (web-mode-html-attr-value-face :foreground ,penumbra-green)
               (web-mode-html-tag-face :foreground ,penumbra-pink :weight bold)
               (web-mode-keyword-face :foreground ,penumbra-pink)
               (web-mode-string-face :foreground ,penumbra-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,penumbra-green)
               ;; whitespace
               (whitespace-big-indent :background ,penumbra-red :foreground ,penumbra-red)
               (whitespace-empty :background ,penumbra-orange :foreground ,penumbra-red)
               (whitespace-hspace :background ,bg3 :foreground ,penumbra-comment)
               (whitespace-indentation :background ,penumbra-orange :foreground ,penumbra-red)
               (whitespace-line :background ,penumbra-bg :foreground ,penumbra-pink)
               (whitespace-newline :foreground ,penumbra-comment)
               (whitespace-space :background ,penumbra-bg :foreground ,penumbra-comment)
               (whitespace-space-after-tab :background ,penumbra-orange :foreground ,penumbra-red)
               (whitespace-space-before-tab :background ,penumbra-orange :foreground ,penumbra-red)
               (whitespace-tab :background ,bg2 :foreground ,penumbra-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'penumbra
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if penumbra-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme))

  (apply #'custom-theme-set-variables
         'penumbra
         (let ((get-func
                (pcase (display-color-cells)
                  ((pred (<= 16777216)) 'car) ; fully graphical envs
                  ((pred (<= 256)) 'cadr)     ; terminal withs 256 colors
                  (_ 'caddr))))               ; should be only tty-like envs
           `((ansi-color-names-vector
              [,(funcall get-func (alist-get 'penumbra-bg colors))
               ,(funcall get-func (alist-get 'penumbra-red colors))
               ,(funcall get-func (alist-get 'penumbra-green colors))
               ,(funcall get-func (alist-get 'penumbra-yellow colors))
               ,(funcall get-func (alist-get 'penumbra-comment colors))
               ,(funcall get-func (alist-get 'penumbra-purple colors))
               ,(funcall get-func (alist-get 'penumbra-cyan colors))
               ,(funcall get-func (alist-get 'penumbra-fg colors))])))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'penumbra)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; penumbra-theme.el ends here
