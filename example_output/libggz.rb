name :
	 Libggz
homepage :
	 http://dev.ggzgamingzone.org/libraries/libggz/
url :
	 https://mirrors.dotsrc.org/ggzgamingzone/ggz/0.0.14.1/libggz-0.0.14.1.tar.gz
description :
	 The libggz library wraps many common low-level functions
build_deps :
link_deps :
	 gettext
	 libgcrypt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAS", "-I#{Formula["gettext"].opt_prefix}/include"
	 ENV.append "LDFLAGS", "-L#{Formula["gettext"].opt_prefix}/lib"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-gcrypt"
	 system "make", "check"
	 system "make", "install"
