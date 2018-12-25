name :
	 Stdman
homepage :
	 https://github.com/jeaye/stdman
url :
	 https://github.com/jeaye/stdman/archive/2018.03.11.tar.gz
description :
	 Formatted C++11/14/17 stdlib man pages from cppreference.com
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
