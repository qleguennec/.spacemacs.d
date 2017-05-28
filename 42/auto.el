(add-to-list 'auto-mode-alist '("\\.h\\'" . load-fileH))
(add-to-list 'auto-mode-alist '("\\.c\\'" . load-fileC))
(global-set-key (kbd "C-c m") 'update-src-Makefile)

(define-skeleton create-protect-include
  "writes header to buffer"
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

(define-skeleton create-lib-makefile
  "writes makefile skeleton to buffer"
  ""
  "NAME = " (skeleton-read "NAME: ")\n
  "SRC = " (mapconcat 'identity (file-expand-wildcards "*.c") " ")\n
  "OBJ = $(SRC:.c=.o)\n"
  "CFLAGS += -g -Wall -Wextra -Werror\n"
  "ARFLAGS = rc\n\n"
  "all: $(NAME)\n\n"
  "$(NAME): $(OBJ)\n"
  "\t"
	"$(AR) $(ARFLAGS) $@ $(OBJ)\n\n"
  "clean:\n"
  "\t"
	"@rm $(OBJ) 2> /dev/null || true\n\n"
  "fclean: clean\n"
  "\t"
	"@rm $(NAME) 2> /dev/null || true\n\n"
  "re: fclean all"
  )

(defun load-fileH ()
  "writes header to buffer and multi-inclusion protections"
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

(defun update-src-Makefile ()
  "updates src section in Makefile"
  (interactive)
  (goto-line 2)
  (kill-line)
  (insert "SRC = ")
  (insert (mapconcat 'identity (file-expand-wildcards "*.c") " "))
  )
