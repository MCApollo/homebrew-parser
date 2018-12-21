name :
	 Clac
homepage :
	 https://github.com/soveran/clac
url :
	 https://github.com/soveran/clac/archive/0.3.2.tar.gz
description :
	 Command-line, stack-based calculator with postfix notation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
