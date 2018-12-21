name :
	 IosWebkitDebugProxy
homepage :
	 https://github.com/google/ios-webkit-debug-proxy
url :
	 https://github.com/google/ios-webkit-debug-proxy/archive/v1.8.3.tar.gz
description :
	 DevTools proxy for iOS devices
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libimobiledevice
	 libplist
	 :macos
	 usbmuxd
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
