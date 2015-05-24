;;Carbon Emacsの設定用ファイル
;;参考にしたサイトは一番下にまとめて掲載

;;ここから以下のサイト参照
;;http://d.hatena.ne.jp/Seitaro/20090214/1234603644
;;====基本的な設定=====
;;ロードパス
;;Espファイルを保存する場所を指定
(setq load-path(cons"~/.emacs.d/elisp"load-path))

;;行数表示
;;カーソルがある位置を表示
(setq line-number-mode t)

;;ビープ音を消す
(setq visible-bell t)

;;テキストモードで自動改行をさせない
(setq text-mode-hook 'turn-off-auto-fill)

;;行番号表示
(require 'linum)
(global-linum-mode)

;;UTF-8についてだけは次を参照
;;http://d.hatena.ne.jp/cos31/20080816/emacs_setting
;;UTF-8
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;----キーボードに関する設定----
;;Macのキーバンドを使う。optionをメタキーにする。
(mac-key-mode 1)
(setq mac-option-modifier 'meta)

;;タブキー
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;;シフト＋矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;;フォント設定
(if (eq window-system 'mac) (require 'carbon-font))
(fixed-width-set-fontset "hirakaku_w3" 12)
(setq fixed-width-rescale nil)



;;----ウィンドウに関する設定----
;;スタートアップページを表示しない
(setq inhibit-startup-message t)

;;ウィンドウ設定
(if window-system (progn
(setq initial-frame-alist '((width . 160) (height . 40) (left . 60)))
(set-background-color "Black")
(set-foreground-color "White")
(set-cursor-color "Gray")
))

;;メニューバーを隠す
(tool-bar-mode -1)

;;透明度の設定
(add-to-list 'default-frame-alist '(alpha . 80))

;;対応する括弧を光らせる
(show-paren-mode 1)

;;ハイライト設定
;;編集行のハイライト
(global-hl-line-mode)

;;ウィンドウ分割時に画面外へ出る文章を折り返す
(setq truncate-partial-width-windows nil)

;;====Elispの設定====

;;====YaTeXに関する設定====
;;setq auto-mode-alist (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist)) 
;;(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t) 
;;(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8" dvi2-command "open -a TeXShop") 


;;MacWikからの引用
;;=============================================================
;;YaTeX起動のため
(setq auto-mode-alist
	  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;;(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8" dvi2-command "open -a TeXShop") 


;;platexコマンドの設定
(setq tex-command "platex")

;;dvipdfmxの設定
(setq dvi2-command "xdvi")
(setq dviprint-command-format "dvipdfmx %s")

;;プレビュアの設定
;;(defvar YaTeX-dvi2-command-ext-alist
;; '(("xdvi".".dvi")
;;	("ghostview¥¥lgv".".ps")
;;	("acroread¥¥lpdf¥¥lPreview¥¥LTeXShop¥¥lSkim".".pdf")))

;;漢字
(setq YaTeX-kanji-code 4)

;；ソースコードの色付け
;;(setq YeTeX-use-hilit 19 nil
;;	  YaTeX-use-font-lock t)
;;=============================================================
;;ここまでMacWikiからの引用

;; Aspellによるスペルチェック
(setq aspell-program-name "/opt/local/bin/aspell")
(eval-after-load "aspell"
  '(setq aspell-skip-region-alist (cons '("[^A-Za-z0-9 -]+")
										aspell-skip-region-alist)))

;;参考サイト
;;CarbonEmacs設定メモ
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default((t (:family "メイリオ" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 )

;;大文字・小文字の変換を無効に
(put 'upcase-region 'disabled nil)


;;Ruby modeの追加
(add-to-list 'auto-mode-alist
			 '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
			 '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
