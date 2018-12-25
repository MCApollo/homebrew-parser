name :
	 Bookloupe
homepage :
	 http://www.juiblex.co.uk/pgdp/bookloupe/
url :
	 http://www.juiblex.co.uk/pgdp/bookloupe/bookloupe-2.0.tar.gz
description :
	 List common formatting errors in a Project Gutenberg candidate file
build_deps :
	 pkg-config
link_deps :
	 glib
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
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
