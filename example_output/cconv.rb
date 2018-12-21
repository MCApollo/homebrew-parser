name :
	 Cconv
homepage :
	 https://github.com/xiaoyjy/cconv
url :
	 https://github.com/xiaoyjy/cconv/archive/v0.6.3.tar.gz
description :
	 Iconv based simplified-traditional Chinese conversion tool
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv"
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
	 rm_f include/"unicode.h"
