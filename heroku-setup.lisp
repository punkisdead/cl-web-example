(in-package :cl-user)

(print ">>> Building system....")

(load (make-pathname :directory *build-dir* :defaults "cl-web-example.asd"))

(ql:quickload #:cl-web-example)

;;; Redefine / extend heroku-toplevel here if necessary.

(print ">>> Done building system")
