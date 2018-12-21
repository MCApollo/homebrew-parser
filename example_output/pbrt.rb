name :
	 Pbrt
homepage :
	 https://pbrt.org/
url :
	 https://github.com/mmp/pbrt-v2/archive/2.0.342.tar.gz
description :
	 Physically based rendering
build_deps :
link_deps :
	 flex
	 openexr
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-C", "src"
	 prefix.install "src/bin"
