name :
	 Ucommon
homepage :
	 https://www.gnu.org/software/commoncpp/
url :
	 https://ftp.gnu.org/gnu/commonc++/ucommon-7.0.0.tar.gz
description :
	 GNU C++ runtime library for threads, sockets, and parsing
build_deps :
	 pkg-config
link_deps :
	 gnutls
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/77f0d9d2/ucommon/cachelinesize.patch
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking",
	 "--disable-silent-rules", "--enable-socks",
	 "--with-sslstack=gnutls", "--with-pkg-config"
	 system "make", "install"
