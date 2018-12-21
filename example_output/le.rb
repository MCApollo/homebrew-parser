name :
	 Le
homepage :
	 https://github.com/lavv17/le
url :
	 https://github.com/lavv17/le/releases/download/v1.16.5/le-1.16.5.tar.xz
description :
	 Text editor with block and binary operations
build_deps :
link_deps :
conflicts :
	 logentries
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
