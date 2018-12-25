name :
	 Urweb
homepage :
	 http://www.impredicative.com/ur/
url :
	 https://github.com/urweb/urweb/releases/download/20180616/urweb-20180616.tar.gz
description :
	 Ur/Web programming language
build_deps :
	 autoconf
	 automake
	 libtool
	 mlton
link_deps :
	 gmp
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --prefix=#{prefix}
	 SITELISP=$prefix/share/emacs/site-lisp/urweb
	 ]
	 system "./configure", *args
	 system "make", "install"
