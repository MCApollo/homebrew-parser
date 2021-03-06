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
optional_deps :
	 emacs
	 python
	 ruby
conflicts :
resource :
	 []
	 []
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
	 end
	 args << "--without-ruby" if build.without? "ruby"
	 system "./configure", *args
	 system "make", "V=1", "install"
	 if build.with? "ruby"
	 cd "bindings/ruby" do
	 inreplace "Makefile", HOMEBREW_PREFIX/"lib/ruby", lib/"ruby"
	 system "make", "install"
	 end
	 end
	 Language::Python.each_python(build) do |python, _version|
	 cd "bindings/python" do
	 system python, *Language::Python.setup_install_args(prefix)
	 end
	 end
