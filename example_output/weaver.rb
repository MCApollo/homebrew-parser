name :
	 Weaver
homepage :
	 https://github.com/scribd/Weaver
url :
	 https://github.com/scribd/Weaver/archive/0.11.1.tar.gz
description :
	 Command-line tool for Weaver
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
