

  ;; تعريف مفتاح الـ Leader (Space)
  (general-create-definer my-leader-def
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"           ; مفتاح المسافة
    :global-prefix "C-SPC") ; للاستخدام في غير Evil mode

  (my-leader-def
    ;; -- القائمة الأساسية --
    "f" '(:ignore t :which-key "file")
    "ff" '(find-file :which-key "Find File")         ; SPC f f (مثل Telescope find_files)
    "fr" '(consult-recent-file :which-key "Recent")  ; SPC f r
    "fs" '(save-buffer :which-key "Save File")       ; SPC f s

    ;; -- البافرز (Buffers) --
    "b" '(:ignore t :which-key "buffer")
    "bb" '(consult-buffer :which-key "Switch Buffer") ; SPC b b (مثل Telescope buffers)
    "bd" '(kill-current-buffer :which-key "Kill Buffer") ; SPC b d

    ;; -- البحث (Search/Telescope style) --
    "s" '(:ignore t :which-key "search")
    "sg" '(consult-ripgrep :which-key "Live Grep")   ; SPC s g (مثل Telescope live_grep)
    "ss" '(consult-line :which-key "Search Line")    ; SPC s s (مثل Telescope current_buffer_fuzzy_find)

    ;; -- متصفح الملفات (Explorer) --
    "e" '(treemacs :which-key "Explorer")            ; SPC e (مثل Neo-tree في LazyVim)
    
    ;; -- النوافذ (Windows) --
    "w" '(:ignore t :which-key "window")
    "wd" '(delete-window :which-key "Delete Window")
    "wv" '(split-window-right :which-key "Split Vertical")
    "ws" '(split-window-below :which-key "Split Horizontal")

    ;; -- المساعدة (Help) --
    "h" '(:ignore t :which-key "help")
    "hf" '(describe-function :which-key "Describe Function")
    "hk" '(describe-key :which-key "Describe Key")))
