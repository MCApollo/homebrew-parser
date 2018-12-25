name :
	 Hexedit
homepage :
	 http://rigaux.org/hexedit.html
url :
	 https://github.com/pixel/hexedit/archive/1.4.2.tar.gz
description :
	 View and edit files in hexadecimal or ASCII
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
