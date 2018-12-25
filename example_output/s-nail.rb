name :
	 SNail
homepage :
	 https://www.sdaoden.eu/code.html
url :
	 https://www.sdaoden.eu/downloads/s-nail-14.9.11.tar.gz
description :
	 Fork of Heirloom mailx
build_deps :
link_deps :
	 libidn
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "OPT_AUTOCC=no",
	 "CC=#{ENV.cc}",
	 "cc_maxtopt=1",
	 "OPT_NOMEMBDBG=1",
	 "C_INCLUDE_PATH=#{Formula["openssl"].opt_include}",
	 "LDFLAGS=-L#{Formula["openssl"].opt_lib}",
	 "VAL_PREFIX=#{prefix}",
	 "OPT_DOTLOCK=no",
	 "config"
	 system "make", "build"
	 system "make", "install"
