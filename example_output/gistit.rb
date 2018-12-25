name :
	 Gistit
homepage :
	 https://gistit.herokuapp.com/
url :
	 https://github.com/jrbasso/gistit/archive/v0.1.3.tar.gz
description :
	 Command-line utility for creating Gists
build_deps :
	 autoconf
	 automake
link_deps :
	 jansson
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mv "configure.in", "configure.ac"
	 system "./autogen.sh", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
