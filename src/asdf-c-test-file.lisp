#|
  This file is a part of asdf-c-test-file project.
  Copyright (c) 2012 Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage asdf-c-test-file
  (:use :cl)
  (:import-from :asdf
                :cl-source-file
                :module
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
  (let ((class (class-of op)))
    (change-class c 'asdf:cl-source-file)
    (perform (make-instance 'compile-op) c)
    (perform (make-instance 'load-op) c)
    (change-class c class)))

(defclass run-test-op (asdf:test-op) ())

#+asdf3
(defmethod component-depends-on ((o run-test-op) (c module))
  `((,o ,@(component-children c)) ,@(call-next-method)))

(import '(test-file run-test-op) :asdf)
