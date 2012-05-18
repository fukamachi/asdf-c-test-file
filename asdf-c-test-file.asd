#|
  This file is a part of asdf-c-test-file project.
  Copyright (c) 2012 Eitarow Fukamachi (e.arrows@gmail.com)
|#

#|
  Provides ASDF component :test-file

  Author: Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage asdf-c-test-file-asd
  (:use :cl :asdf))
(in-package :asdf-c-test-file-asd)

(defsystem asdf-c-test-file
  :version "0.1-SNAPSHOT"
  :author "Eitarow Fukamachi"
  :license "LLGPL"
  :depends-on (:asdf)
  :components ((:module "src"
                :components
                ((:file "asdf-c-test-file"))))
  :description "Provides ASDF component :test-file"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op asdf-c-test-file-test))))
