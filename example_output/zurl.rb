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
optional_deps :
conflicts :
resource :
	 ['pyzmq']
	 ['https://files.pythonhosted.org/packages/1e/f9/d0675409c11d11e549e3da000901cfaabd848da117390ee00030e14bfdb6/pyzmq-16.0.3.tar.gz']
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--extraconf=QMAKE_MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
