name :
	 GnustepMake
homepage :
	 http://gnustep.org
url :
	 http://ftpmain.gnustep.org/pub/gnustep/core/gnustep-make-2.7.0.tar.gz
description :
	 Basic GNUstep Makefiles
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
	 system "./configure", "--prefix=#{prefix}",
	 "--with-config-file=#{prefix}/etc/GNUstep.conf",
	 "--enable-native-objc-exceptions"
	 system "make", "install", "tooldir=#{libexec}"
