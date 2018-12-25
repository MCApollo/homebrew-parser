name :
	 Libsmf
homepage :
	 https://sourceforge.net/projects/libsmf/
url :
	 https://downloads.sourceforge.net/project/libsmf/libsmf/1.3/libsmf-1.3.tar.gz
description :
	 C library for handling SMF ('*.mid') files
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
