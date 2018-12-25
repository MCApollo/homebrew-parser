name :
	 SblimSfcc
homepage :
	 https://sourceforge.net/projects/sblim/
url :
	 https://downloads.sourceforge.net/project/sblim/sblim-sfcc/sblim-sfcc-2.2.8.tar.bz2
description :
	 Project to enhance the manageability of GNU/Linux system
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
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
