name :
	 Bittwist
homepage :
	 https://bittwist.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/bittwist/Mac%20OS%20X/Bit-Twist%202.0/bittwist-macosx-2.0.tar.gz
description :
	 Libcap-based Ethernet packet generator
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "prefix=#{prefix}"
