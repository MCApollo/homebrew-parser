name :
	 Daemonlogger
homepage :
	 https://sourceforge.net/projects/daemonlogger/
url :
	 https://downloads.sourceforge.net/project/daemonlogger/daemonlogger-1.2.1.tar.gz
description :
	 Network packet logger and soft tap daemon
build_deps :
link_deps :
	 libdnet
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
