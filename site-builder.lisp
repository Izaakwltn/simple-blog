;;;;site-builder.lisp

(in-package :simple-blog)

(defvar *blog-server* (make-instance 'hunchentoot:easy-acceptor :port 4242
  :document-root #p"/simple-blog/www/"))





;;;http://127.0.0.1:4242/blog.html
