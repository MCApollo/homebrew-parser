name :
	 Bam
homepage :
	 https://matricks.github.io/bam/
url :
	 https://github.com/matricks/bam/archive/v0.5.1.tar.gz
description :
	 Build system that uses Lua to describe the build process
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./make_unix.sh"
	 bin.install "bam"
