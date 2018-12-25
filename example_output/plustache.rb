name :
	 Plustache
homepage :
	 https://github.com/mrtazz/plustache
url :
	 https://github.com/mrtazz/plustache/archive/0.4.0.tar.gz
description :
	 C++ port of Mustache templating system
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "--force", "--install"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
