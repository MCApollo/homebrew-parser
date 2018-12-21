name :
	 Passwdqc
homepage :
	 https://www.openwall.com/passwdqc/
url :
	 https://www.openwall.com/passwdqc/passwdqc-1.3.1.tar.gz
description :
	 Password/passphrase strength checking and enforcement toolset
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 BINDIR=#{bin}
	 CC=#{ENV.cc}
	 CONFDIR=#{etc}
	 DEVEL_LIBDIR=#{lib}
	 INCLUDEDIR=#{include}
	 MANDIR=#{man}
	 PREFIX=#{prefix}
	 SECUREDIR_DARWIN=#{prefix}/pam
	 SHARED_LIBDIR=#{lib}
	 ]
	 system "make", *args
	 system "make", "install", *args
