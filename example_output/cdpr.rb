name :
	 Cdpr
homepage :
	 http://www.monkeymental.com/
url :
	 https://downloads.sourceforge.net/project/cdpr/cdpr/2.4/cdpr-2.4.tgz
description :
	 Cisco Discovery Protocol Reporter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, ENV.cflags, "cdpr.c", "cdprs.c", "conffile.c", ENV.ldflags, "-lpcap", "-o", "cdpr"
	 bin.install "cdpr"
