;; ---------------------
;; Configuration for LSP
;; ---------------------
(provide 'mod-lsp)

(use-package lsp-mode
  :straight t
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
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package helm-lsp
  :straight t
  :commands helm-lsp-workspace-symbol)

(use-package company-lsp
  :straight t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends))
