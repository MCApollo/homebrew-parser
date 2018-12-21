name :
	 Convmv
homepage :
	 https://www.j3e.de/linux/convmv/
url :
	 https://www.j3e.de/linux/convmv/convmv-2.05.tar.gz
description :
	 Filename encoding conversion tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
