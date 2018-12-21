name :
	 Notmuch
homepage :
	 https://notmuchmail.org
url :
	 https://notmuchmail.org/releases/notmuch-0.27.tar.gz
description :
	 Thread-based email index, search, and tagging
build_deps :
	 doxygen
	 libgpg-error
	 pkg-config
	 sphinx-doc
link_deps :
	 glib
	 gmime
	 talloc
	 xapian
	 zlib
	 python@2
	 emacs
	 python
	 ruby
conflicts :
patches :
EOF_patch :
	 diff --git a/bindings/python/notmuch/globals.py b/bindings/python/notmuch/globals.py
	 index b1eec2c..bce5190 100644
	 --- a/bindings/python/notmuch/globals.py
	 +++ b/bindings/python/notmuch/globals.py
	 @@ -25,7 +25,7 @@ from notmuch.version import SOVERSION
	 try:
	 from os import uname
	 if uname()[0] == 'Darwin':
	 -        nmlib = CDLL("libnotmuch.{0:s}.dylib".format(SOVERSION))
	 +        nmlib = CDLL("HOMEBREW_PREFIX/lib/libnotmuch.{0:s}.dylib".format(SOVERSION))
	 else:
	 nmlib = CDLL("libnotmuch.so.{0:s}".format(SOVERSION))
	 except:
install :
	 ENV.prepend_path "PYTHONPATH", Formula["sphinx-doc"].opt_libexec/"vendor/lib/python2.7/site-packages"
	 ENV.prepend_path "PYTHONPATH", Formula["sphinx-doc"].opt_libexec/"lib/python2.7/site-packages"
	 args = %W[--prefix=#{prefix} --mandir=#{man}]
	 if build.with? "emacs"
	 ENV.deparallelize
	 args << "--with-emacs" << "--emacslispdir=#{elisp}" << "--emacsetcdir=#{elisp}"
	 else
	 args << "--without-emacs"
