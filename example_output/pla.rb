name :
	 Pla
homepage :
	 https://www.arpalert.org/pla.html
url :
	 https://www.arpalert.org/src/pla-1.2.tar.gz
description :
	 Tool for building Gantt charts in PNG, EPS, PDF or SVG format
build_deps :
	 pkg-config
link_deps :
	 cairo
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "pla"
