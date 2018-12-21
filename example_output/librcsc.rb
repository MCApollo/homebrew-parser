name :
	 Librcsc
homepage :
	 https://osdn.net/projects/rctools/
url :
	 https://dotsrc.dl.osdn.net/osdn/rctools/51941/librcsc-4.1.0.tar.gz
description :
	 RoboCup Soccer Simulator library
build_deps :
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}"
	 system "make", "install"
