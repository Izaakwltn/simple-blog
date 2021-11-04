;;;;simple-blog.asd

(asdf:defsystem #:simple-blog
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "A simple blog layout written in Lisp"
  :depends-on (#:hunchentoot #:spinneret)
  :serial t
  :components ((:file "package")
	       (:file "site-builder")
	       (:file "blog-page-template")
	       (:file "blog-entry")
	       (:module "www"
		:serial t
		:components ((:file "blog-home-page")
			     (:file "blog-post1")
			     (:file "blog-post2")
			     (:file "blog-post3")))))
