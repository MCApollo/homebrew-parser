name :
	 Re2c
homepage :
	 http://re2c.org
url :
	 https://github.com/skvadrik/re2c/releases/download/1.1.1/re2c-1.1.1.tar.gz
description :
	 Generate C-based recognizers from regular expressions
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
