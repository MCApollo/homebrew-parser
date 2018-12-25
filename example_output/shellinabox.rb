name :
	 Shellinabox
homepage :
	 https://github.com/shellinabox/shellinabox
url :
	 https://github.com/shellinabox/shellinabox/archive/v2.20.tar.gz
description :
	 Export command-line tools to web based terminal emulator
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
