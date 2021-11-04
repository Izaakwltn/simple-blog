;;;;blog-entry.lisp

(in-package :simple-blog)

;;;blog-entry class

(defparameter *blog-list* nil)

(defclass blog-entry ()
  ((title         :initarg :title
	          :accessor title)
   (url-extension :initarg :url-ext
		  :accessor url-ext)
   (description   :initarg :description
		  :accessor description)
   (article       :initarg :article
		  :accessor article)))

(defmethod print-object ((obj blog-entry) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((title title)
		     (description description)
		     (article article))
	obj
      (format stream "Title:~a~%~%Description:~a~%~%Article:~%~A~%" title description article))))

(defun post-blog-entry (title-string url-extension description-string article-function)
  "Performs two functions: pushes the blog entry's information to *blog-list* for use on the main page,
and pushes the page to the *dispatch-table*."
  (progn
    (push (make-instance 'blog-entry :title title-string
			             :url-ext url-extension
		                     :description description-string
				     :article article-function) ;use (blog1) or something similar
	  *blog-list*)
    (push (hunchentoot::create-prefix-dispatcher url-extension article-function)
	  hunchentoot:*dispatch-table*)))

      
