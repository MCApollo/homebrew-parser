name :
	 Libcapn
homepage :
	 http://libcapn.org/
url :
description :
	 C library to send push notifications to Apple devices
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 if build.stable?
	 (buildpath/"src/third_party/jansson").install resource("jansson")
