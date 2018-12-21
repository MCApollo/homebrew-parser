name :
	 Boxes
homepage :
	 https://boxes.thomasjensen.com/
url :
	 https://github.com/ascii-boxes/boxes/archive/v1.2.tar.gz
description :
	 Draw boxes around text
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "GLOBALCONF=#{share}/boxes-config", "CC=#{ENV.cc}"
	 bin.install "src/boxes"
	 man1.install "doc/boxes.1"
	 share.install "boxes-config"
