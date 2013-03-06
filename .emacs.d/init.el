(require 'package)
(add-to-list 'package-archives
			              '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(unless (package-installed-p 'clojure-mode)
    (package-refresh-contents)
    (package-install 'clojure-mode))


(require 'paredit) ;; if you didn't install it via package.el
(add-hook 'clojure-mode-hook 'paredit-mode)
