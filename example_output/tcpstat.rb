name :
	 Tcpstat
homepage :
	 https://github.com/jtt/tcpstat
url :
	 https://github.com/jtt/tcpstat/archive/rel-0-1.tar.gz
description :
	 Active TCP connections monitoring tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "tcpstat"
