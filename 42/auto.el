(add-to-list 'auto-mode-alist '("\\.h\\'" . load-fileH))
(add-to-list 'auto-mode-alist '("\\.c\\'" . load-fileC))

(define-skeleton create-protect-include
  "Create a protection to Includes"
  ""
  "\n"
  "#ifndef		"
  (setq file_name (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
  "_"
  (setq file_ext (upcase (file-name-extension (file-name-nondirectory buffer-file-name))))
  "\n"
  "# define	"file_name"_"file_ext
  "\n"
  "\n"
  "\n"
  "\n"
  "#endif"
  )

(defun load-fileH ()
  "write header to buffer and multi-inclusion protections"
  (interactive)
  (goto-char(point-min))
  (c-mode)
  (if  (< (buffer-size) 10)
      (progn
        (create-protect-include)
        (header-insert)
        (goto-char(point-max))
        (backward-char 8)
        ))
  )

(defun load-fileC ()
  "write header to buffer"
  (interactive)
  (goto-char(point-min))
  (c-mode)
  (if  (< (buffer-size) 10)
      (progn
        (newline)
        (header-insert)
        (goto-char(point-max))
        ))
  )
