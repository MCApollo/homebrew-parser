name :
	 Zurl
homepage :
	 https://github.com/fanout/zurl
url :
	 https://dl.bintray.com/fanout/source/zurl-1.9.1.tar.bz2
description :
	 HTTP and WebSocket client worker with ZeroMQ interface
build_deps :
	 pkg-config
link_deps :
	 python@2
	 curl
	 qt
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--extraconf=QMAKE_MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
