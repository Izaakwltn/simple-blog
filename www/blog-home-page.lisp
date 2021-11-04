;;;;blog-home-page.lisp
(in-package :simple-blog)

(defun blog-home-page ()
  (with-blog-page (:title "Blog")
    (:header
     (:h1 "Blog"))
    (:section
     (:ul (loop for b in *blog-list*
		do (:li (:a :href (url-ext b) (:button (format nil "~a" (title b))))
		        (:i (description b))))))))

(push (hunchentoot:create-prefix-dispatcher "/blog.html" #'blog-home-page)
      hunchentoot:*dispatch-table*)



