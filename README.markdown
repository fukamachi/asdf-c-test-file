# asdf-c-test-file - Provides ASDF component :test-file.

## Usage

    (defsystem foo
      :defsystem-depends-on (:asdf-c-test-file)
      :in-order-to ((test-op (run-test-op foo))) ;; Need for ASDF3
      :components
      ((:module "src"
        :components
        ((:file "core")
         (:file "util")))
       (:test-file "test/core")
       (:test-file "test/util")))

## Description

asdf-c-test-file provides `:test-file` as an ASDF component which is for a test file to run only when `asdf:test-system`.

## Author

* Eitarow Fukamachi (e.arrows@gmail.com)

## Copyright

Copyright (c) 2012 Eitarow Fukamachi (e.arrows@gmail.com)

# License

Licensed under the LLGPL License.

