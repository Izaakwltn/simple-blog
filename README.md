# simple-blog

A simple blog system written in Common Lisp

This is an example of a blog written in Common Lisp, with an automatically updating main blog page.

To see the example, go to site-builder.lisp, change the path to "simple-blog/www/", 
then in the repl, load the system:
(in-package :simple-blog)
(hunchentoot::start *blog-server*)


Use the function #'post-blog-entry to push the blog entry to the main blog page,at the same time as creating its url extension. Any posts including post-blog-entry that are saved in the main folder will be included on the main blog page.

#### Example:
(in-package :simple-blog)

(defun blog-post1 ()
  (with-blog-page (:title "Sample blog #1")
    (:header
     (:h1 "Sample Blog # 1"))
    (:p "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In eu mi bibendum neque egestas congue quisque. Ipsum a arcu cursus vitae. Ut morbi tincidunt augue interdum velit euismod in. Scelerisque felis imperdiet proin fermentum leo vel orci porta non. Massa massa ultricies mi quis hendrerit dolor magna eget. Mi tempus imperdiet nulla malesuada pellentesque elit eget. Praesent elementum facilisis leo vel fringilla. Pellentesque nec nam aliquam sem et tortor consequat id porta. Sed velit dignissim sodales ut eu sem integer vitae. Purus gravida quis blandit turpis cursus in. Neque viverra justo nec ultrices dui sapien. Nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis. Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Leo vel fringilla est ullamcorper eget nulla facilisi. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi.")))

(post-blog-entry "Sample Blog #1"  ;;;;Title
		             "/blog-post1.html"  ;;;;Url extension
		             "This is the description of a rather interesting article" ;;;;Description
		             #'blog-post1) ;;;;article/webpage function
