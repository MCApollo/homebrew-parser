name :
	 Pushpin
	 TestHandler
homepage :
	 https://pushpin.org/
url :
	 https://dl.bintray.com/fanout/source/pushpin-1.18.0.tar.bz2
description :
	 Reverse proxy for realtime web services
build_deps :
	 pkg-config
link_deps :
	 mongrel2
	 qt
	 zeromq
	 zurl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--configdir=#{etc}",
	 "--rundir=#{var}/run",
	 "--logdir=#{var}/log",
	 "--extraconf=QMAKE_MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
