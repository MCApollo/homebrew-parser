name :
	 Ape
homepage :
	 http://www.ape-project.org/
url :
	 https://github.com/APE-Project/APE_Server/archive/v1.1.2.tar.gz
description :
	 Ajax Push Engine
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./build.sh"
	 (prefix+"etc").mkdir
	 inreplace "Makefile", "bin/ape.conf $(bindir)", "bin/ape.conf $(prefix)/etc"
	 system "make", "install", "prefix=#{prefix}"
