name :
	 Kytea
homepage :
	 http://www.phontron.com/kytea/
url :
	 http://www.phontron.com/kytea/download/kytea-0.4.7.tar.gz
description :
	 Toolkit for analyzing text, especially Japanese and Chinese
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
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
