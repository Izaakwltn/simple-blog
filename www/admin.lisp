;;;;admin.lisp

(in-package :simple-blog)

(defvar admin-username "aardvark")
(defvar admin-password "123456789")

(defvar session-code) ;;;;maybe (session) function that generates the section suffix

;;;;shit maybe this isn't necessary, instead just use the logout page to push a blank/logged out

(defun admin-login ()
  (with-blog-page (:title "Admin Log-in")
    (:header
     (:h1 "Admin Log-in"))
    (:section
     (:form :action "/admin-login" :id "admin-login" :method "get"
      (:p  "Username: ")
      (:input :type "text"
	      :id "username"
	      :name "username"
	      :form "admin-login")
      (:p "Password: ")
      (:input :type "password"
	      :form "admin-login"
	      :id "pass"
	      :name "password"
	      :minlength "8"
              :autocomplete "current-password"
	      :required)
     (:input :type "submit" :value "Sign in" :class "button")))))

(push (hunchentoot:create-prefix-dispatcher "/admin.html" #'admin-login)
      hunchentoot:*dispatch-table*)

;;;;------------------------------------------------------------------------
;;;;Make a handler for the username/password:
;;;;------------------------------------------------------------------------
(hunchentoot::define-easy-handler (admin-login :uri "/admin-login")
    (username password)
  (setf (hunchentoot:content-type*) "text/html")
  (setq session-code (jumble 10))
  (if (and (equal (write-to-string username) (write-to-string admin-username))
	   (equal (write-to-string password) (write-to-string admin-password)))
      (progn
	(push (hunchentoot:create-prefix-dispatcher
	       ;(concatenate 'string
		;	    "/"
		;	    session-code
			    "/admin.html"
	       #'admin-page)
	      hunchentoot:*dispatch-table*)
	(spinneret::with-html-string
	  (:doctype)
	  (:html
	   (:head
	    (:meta :http-equiv "refresh"
		   :content "0; url=http://127.0.0.1:4242/admin.html")))))
		   ;(concatenate 'string
		;			 "0; url=http://127.0.0.1:4242/"
                 ;                        session-code
		;			 "admin-page.html"))))))
      (format nil "nope")))
  ;(format nil "~a~a~a~a~a" username password (write-to-string password) (write-to-string admin-password); (equal (write-to-string password) (write-to-string admin-password))))
;  (if (equal (write-to-string password) (write-to-string admin-password))
 ;     (with-page (:title "You did it!")
;	(:header
;	 (:h1 "You did it!")))
 ;     (with-page (:title "You fucked up")
;	(:header
;	 (:h1 "You fucked up")))))


(defun log-out ()
  (
  (spinneret::with-html-string
	  (:doctype)
	  (:html
	   (:head
	    (progn (:meta :http-equiv "refresh" :content "0; url=http://127.0.0.1:4242/blog.html")))))

;;;;------------------------------------------------------------------------
;;;;The proper admin page:
;;;;------------------------------------------------------------------------

(defun admin-page ()
  (with-blog-page (:title "Admin Access")
    (:header
     (:h1 "Admin Access"))
    (:section
     (:p "Hello there!")
     (:button :value "Log out"
	      :onclick (progn ((push (hunchentoot:create-prefix-dispatcher "/admin.html" #'admin-login)
	      hunchentoot:*dispatch-table*)))))

(hunchentoot::define-easy-handler (log-out :uri "/log-out")
    ()
  (setf (hunchentoot:content-type*) "text/html")
  (push (hunchentoot:create-prefix-dispatcher "/admin.html" #'admin-login)
	      hunchentoot:*dispatch-table*)
	(spinneret::with-html-string
	  (:doctype)
	  (:html
	   (:head
	    (:meta :http-equiv "refresh" :content "0; url=http://127.0.0.1:4242/admin-page.html"))))
      (format nil "nope"))

(push (hunchentoot:create-prefix-dispatcher "/admin-page.html" #'admin-page)
      hunchentoot:*dispatch-table*)

(push (hunchentoot:create-prefix-dispatcher "/admin-page.html" #'admin-login)
      hunchentoot:*dispatch-table*)




;;;;security (passwords/usernames/encryption)

(defun jumble (n)
  "Makes a number jumble of length n"
  (cond ((zerop n) nil)
	(t (concatenate 'string (write-to-string (random 10)) (jumble (- n 1))))))
