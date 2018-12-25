name :
	 Optipng
homepage :
	 https://optipng.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/optipng/OptiPNG/optipng-0.7.7/optipng-0.7.7.tar.gz
description :
	 PNG file optimizer
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
	 system "./configure", "--with-system-zlib",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
