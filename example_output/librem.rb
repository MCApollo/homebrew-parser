name :
	 Librem
homepage :
	 http://www.creytiv.com
url :
	 http://www.creytiv.com/pub/rem-0.5.3.tar.gz
description :
	 Toolkit library for real-time audio and video processing
build_deps :
link_deps :
	 libre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libre = Formula["libre"]
	 system "make", "install", "PREFIX=#{prefix}",
	 "LIBRE_MK=#{libre.opt_share}/re/re.mk",
	 "LIBRE_INC=#{libre.opt_include}/re",
	 "LIBRE_SO=#{libre.opt_lib}"
