name :
	 Dash
homepage :
	 http://gondor.apana.org.au/~herbert/dash/
url :
	 http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.10.2.tar.gz
description :
	 POSIX-compliant descendant of NetBSD's ash (the Almquist SHell)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--with-libedit",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"
