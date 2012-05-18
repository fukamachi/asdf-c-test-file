#|
  This file is a part of asdf-c-test-file project.
  Copyright (c) 2012 Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage asdf-c-test-file
  (:use :cl)
  (:import-from :asdf
                :cl-source-file
                :perform
                :load-op
                :compile-op
                :test-op)
  (:export :test-file))
(in-package :asdf-c-test-file)

(defclass test-file (cl-source-file) ())

(defmethod perform ((op load-op) (c test-file))
  ;; do nothing
  )
(defmethod perform ((op compile-op) (c test-file))
  ;; do nothing
  )

(defmethod perform ((op test-op) (c test-file))
  (with-open-file (log-stream
                   (merge-pathnames ".log"
                                    (slot-value c 'asdf::absolute-pathname))
                   :direction :output
                   :if-does-not-exist :create
                   :if-exists :supersede)
    (let ((*standard-output*
           (make-broadcast-stream *standard-output* log-stream))
          (*error-output*
           (make-broadcast-stream *error-output* log-stream)))
      (perform (make-instance 'compile-op)
               (change-class c 'cl-source-file))
      (perform (make-instance 'load-op)
               (change-class c 'cl-source-file)))))

(in-package :asdf)
(import 'asdf-c-test-file:test-file :asdf)
