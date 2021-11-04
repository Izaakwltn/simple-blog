;;;;blog-post1.lisp

(in-package :simple-blog)

(defun blog-post2 ()
  (with-blog-page (:title "Sample blog #2")
    (:header
     (:h1 "Sample Blog # 2"))
    (:p "fringilla urna porttitor rhoncus dolor purus non enim praesent elementum facilisis leo vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros")))

(post-blog-entry "Sample Blog #2"
		 "/blog-post2.html"
		 "Read and learn!"
		 #'blog-post2)
