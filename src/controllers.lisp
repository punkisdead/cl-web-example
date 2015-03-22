(in-package #:cl-web-example)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'controller-to-index)
       (create-regex-dispatcher "^/movies$" 'controller-index)
       (create-regex-dispatcher "^/movies/new" 'controller-new)
       (create-regex-dispatcher "^/add-movie" 'controller-add-movie)
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))

(defun controller-to-index ()
  (redirect "/movies"))

(defun controller-add-movie ()
  (let ((title (parameter "movie-title"))
        (rating (parameter "movie-rating"))
        (year (parse-integer (parameter "year")))
        (month (parse-integer (parameter "month")))
        (day (parse-integer (parameter "day"))))
    (movie-create :title title :rating rating :release-date (encode-date year month day)))
  (redirect "/movies"))
