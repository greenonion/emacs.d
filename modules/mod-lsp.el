;; ---------------------
;; Configuration for LSP
;; ---------------------
(provide 'mod-lsp)

(use-package lsp-mode
  :straight t
  :init
  ;; Config picked up from doom emacs
  ;; Disable features that have great potential to be slow.
  (setq lsp-enable-folding nil
        lsp-enable-text-document-color nil)
  ;; Reduce unexpected modifications to code
  (setq lsp-enable-on-type-formatting nil)
  ;; Make breadcrumbs opt-in; they're redundant with the modeline and imenu
  (setq lsp-headerline-breadcrumb-enable nil)

  :hook (ruby-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (setq lsp-enable-snippet nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-peek-enable t
        lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 72         ; 150 (default) is too wide
        lsp-ui-doc-delay 0.75           ; 0.2 (default) is too naggy
        lsp-ui-doc-show-with-mouse nil  ; don't disappear on mouseover
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-ignore-duplicate t
        ;; Don't show symbol definitions in the sideline. They are pretty noisy,
        ;; and there is a bug preventing Flycheck errors from being shown (the
        ;; errors flash briefly and then disappear).
        lsp-ui-sideline-show-hover nil
        ;; Re-enable icon scaling (it's disabled by default upstream for Emacs
        ;; 26.x compatibility; see emacs-lsp/lsp-ui#573)
        lsp-ui-sideline-actions-icon lsp-ui-sideline-actions-icon-default))

(use-package helm-lsp
  :straight t
  :commands helm-lsp-workspace-symbol helm-lsp-global-workspace-symbol)

(use-package company-lsp
  :straight t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends))
