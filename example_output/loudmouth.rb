name :
	 Loudmouth
homepage :
	 https://mcabber.com
url :
	 https://mcabber.com/files/loudmouth/loudmouth-1.5.3.tar.bz2
description :
	 Lightweight C library for the Jabber protocol
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 gnutls
	 libidn
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh", "-n" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--with-ssl=gnutls"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 (pkgshare/"examples").install Dir["examples/*.c"]
