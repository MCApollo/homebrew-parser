name :
	 Tldr
homepage :
	 https://tldr.sh/
url :
	 https://github.com/tldr-pages/tldr-cpp-client/archive/v1.3.0.tar.gz
description :
	 Simplified and community-driven man pages
build_deps :
	 pkg-config
link_deps :
	 libzip
conflicts :
	 tealdeer
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
