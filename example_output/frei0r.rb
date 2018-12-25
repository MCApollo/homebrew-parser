name :
	 Frei0r
homepage :
	 https://frei0r.dyne.org/
url :
	 https://files.dyne.org/frei0r/releases/frei0r-plugins-1.6.1.tar.gz
description :
	 Minimalistic plugin API for video effects
build_deps :
	 autoconf
	 pkg-config
link_deps :
optional_deps :
	 cairo
	 opencv@2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["CAIRO_CFLAGS"] = "-I#{Formula["cairo"].opt_include}/cairo" if build.with? "cairo"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
