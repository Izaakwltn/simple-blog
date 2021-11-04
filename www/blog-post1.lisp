;;;;blog-post1.lisp

(in-package :simple-blog)

(defun blog-post1 ()
  (with-blog-page (:title "Sample blog #1")
    (:header
     (:h1 "Sample Blog # 1"))
    (:p "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In eu mi bibendum neque egestas congue quisque. Ipsum a arcu cursus vitae. Ut morbi tincidunt augue interdum velit euismod in. Scelerisque felis imperdiet proin fermentum leo vel orci porta non. Massa massa ultricies mi quis hendrerit dolor magna eget. Mi tempus imperdiet nulla malesuada pellentesque elit eget. Praesent elementum facilisis leo vel fringilla. Pellentesque nec nam aliquam sem et tortor consequat id porta. Sed velit dignissim sodales ut eu sem integer vitae. Purus gravida quis blandit turpis cursus in. Neque viverra justo nec ultrices dui sapien. Nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis. Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Leo vel fringilla est ullamcorper eget nulla facilisi. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi.")))

(post-blog-entry "Sample Blog #1"
		 "/blog-post1.html"
		 "This is the description of a rather interesting article"
		 #'blog-post1)
