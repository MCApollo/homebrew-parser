name :
	 Baresip
homepage :
	 http://www.creytiv.com/baresip.html
url :
	 http://www.creytiv.com/pub/baresip-0.5.10.tar.gz
description :
	 Modular SIP useragent
build_deps :
link_deps :
	 libre
	 librem
conflicts :
patches :
EOF_patch :
install :
	 if MacOS::Xcode.installed? && MacOS::Xcode.version.to_i >= 7
	 ENV.delete("SDKROOT")
	 ENV.delete("HOMEBREW_SDKROOT") if MacOS::Xcode.without_clt?
	 end
	 libre = Formula["libre"]
	 system "make", "install", "PREFIX=#{prefix}",
	 "LIBRE_MK=#{libre.opt_share}/re/re.mk",
	 "LIBRE_INC=#{libre.opt_include}/re",
	 "LIBRE_SO=#{libre.opt_lib}",
	 "MOD_AUTODETECT=",
	 "USE_AVCAPTURE=1",
	 "USE_COREAUDIO=1",
	 "USE_G711=1",
	 "USE_OPENGL=1",
	 "USE_STDIO=1",
	 "USE_UUID=1"
