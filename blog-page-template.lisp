;;;;blog-page.lisp
(in-package :simple-blog)

(defmacro with-blog-page ((&key title) &body body)
  `(spinneret::with-html-string
    (:doctype)
     (:html
      (:head
       (:meta :charset "utf-8")
	(:meta :name "viewport" :content "width=device-width, initial-scale=1")
	(:link :rel "stylesheet"
	       :href "https://cdn.simplecss.org/simple.min.css")
        (:title ,title))
      (:header
       (:nav
	(:a :href "blog.html" "Blog")))
      (:body ,@body))))




      
