name :
	 PonyStable
homepage :
	 https://github.com/ponylang/pony-stable
url :
	 https://github.com/ponylang/pony-stable/archive/0.1.6.tar.gz
description :
	 Dependency manager for the Pony language
build_deps :
link_deps :
	 ponyc
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "install"
