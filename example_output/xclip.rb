name :
	 Xclip
homepage :
	 https://github.com/astrand/xclip
url :
	 https://github.com/astrand/xclip/archive/0.13.tar.gz
description :
	 Command-line utility that is designed to run on any system with an X11
build_deps :
	 autoconf
	 automake
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
