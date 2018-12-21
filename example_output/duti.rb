name :
	 Duti
homepage :
	 https://github.com/moretension/duti/
url :
	 https://github.com/moretension/duti/archive/duti-1.5.4.tar.gz
description :
	 Select default apps for documents and URL schemes on macOS
build_deps :
	 autoconf
link_deps :
conflicts :
patches :
	 https://github.com/moretension/duti/pull/32.patch
EOF_patch :
install :
	 system "autoreconf", "-vfi"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
