(in-package #:cl-web-example)

(defun heroku-getenv (target)
  #+ccl (ccl:getenv target)
  #+sbcl (sb-posix:getenv target))

(defvar *database-url* (heroku-getenv "DATABASE_URL"))
(defvar *local-db-params* '("cl-example" "postgres" "postgres" "localhost"))

(defun db-params ()
  "Heroku database url format is postgres://username:password@host/database_name. If we are testing on localhost, use the db-parameters from *local-db-params*."
  (if *database-url*
      (let* ((url (second (cl-ppcre:split "//" *database-url*)))
             (user (first (cl-ppcre:split ":" (first (cl-ppcre:split "@" url)))))
             (password (second (cl-ppcre:split ":" (first (cl-ppcre:split "@" url)))))
             (host (first (cl-ppcre:split "/" (second (cl-ppcre:split "@" url)))))
             (database (second (cl-ppcre:split "/" (second (cl-ppcre:split "@" url))))))
        (list database user password host))
      *local-db-params*))
