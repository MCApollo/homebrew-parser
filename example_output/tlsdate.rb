name :
	 Tlsdate
homepage :
	 https://www.github.com/ioerror/tlsdate/
url :
	 https://github.com/ioerror/tlsdate/archive/tlsdate-0.0.13.tar.gz
description :
	 Secure rdate replacement
build_deps :
	 autoconf
	 automake
	 libevent
	 libtool
	 pkg-config
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/ioerror/tlsdate/pull/160.patch?full_index=1
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
