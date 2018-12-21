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
