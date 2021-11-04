;;;;blog-post3.lisp

(in-package :simple-blog)

(defun blog-post3 ()
  (with-blog-page (:title "Sample blog #3")
    (:header
     (:h1 "Sample Blog # 3"))
    (:p "fringilla urna porttitor rhoncus dolor purus non enim praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros")))

(post-blog-entry "Sample Blog #3"
		 "/blog-post3.html"
		 "A real blog's blog."
		 #'blog-post3)
