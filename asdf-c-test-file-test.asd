#|
  This file is a part of asdf-c-test-file project.
  Copyright (c) 2012 Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage asdf-c-test-file-test-asd
  (:use :cl :asdf))
(in-package :asdf-c-test-file-test-asd)

(defsystem asdf-c-test-file-test
  :author "Eitarow Fukamachi"
  :license "LLGPL"
  :depends-on (:asdf-c-test-file
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "asdf-c-test-file"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
