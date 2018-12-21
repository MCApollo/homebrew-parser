name :
	 Dvdauthor
homepage :
	 https://dvdauthor.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/dvdauthor/dvdauthor-0.7.2.tar.gz
description :
	 DVD-authoring toolset
build_deps :
	 pkg-config
link_deps :
	 freetype
	 libdvdread
	 libpng
	 libxml2
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
