name :
	 Spdylay
homepage :
	 https://github.com/tatsuhiro-t/spdylay
url :
	 https://github.com/tatsuhiro-t/spdylay/archive/v1.4.0.tar.gz
description :
	 Experimental implementation of SPDY protocol versions 2, 3, and 3.1
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libevent
	 libxml2
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 ENV["ac_cv_search_clock_gettime"] = "no"