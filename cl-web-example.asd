;;;; cl-web-example.asd

(asdf:defsystem #:cl-web-example
  :description "Describe cl-web-example here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:hunchentoot
               #:cl-who
               #:postmodern
               #:simple-date)
  :serial t
  :components ((:file "package")
               (:module :src
                        :serial t
                        :components
                        ((:module :util
                                  :serial t
                                  :components ((:file "date-utils")
                                               (:file "general-utils")
                                               (:file "heroku-utils")
                                               (:file "model-utils")
                                               (:file "html-utils")))
                         (:file "models")
                         (:module :views
                                  :serial t
                                  :components ((:file "layout")
                                               (:file "index")
                                               (:file "new")))))))
