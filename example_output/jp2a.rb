name :
	 Jp2a
homepage :
	 https://csl.name/jp2a/
url :
	 https://downloads.sourceforge.net/project/jp2a/jp2a/1.0.6/jp2a-1.0.6.tar.gz
description :
	 Convert JPG images to ASCII
build_deps :
link_deps :
	 jpeg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "test"
	 system "make", "install"
