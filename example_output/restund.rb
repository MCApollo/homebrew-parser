name :
	 Restund
homepage :
	 http://www.creytiv.com
url :
	 http://www.creytiv.com/pub/restund-0.4.12.tar.gz
description :
	 Modular STUN/TURN server
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
	 system "make", "config", "DESTDIR=#{prefix}",
	 "PREFIX=#{prefix}",
	 "LIBRE_MK=#{libre.opt_share}/re/re.mk",
	 "LIBRE_INC=#{libre.opt_include}/re",
	 "LIBRE_SO=#{libre.opt_lib}"
