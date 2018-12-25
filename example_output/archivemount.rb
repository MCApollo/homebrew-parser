name :
	 Archivemount
homepage :
	 https://www.cybernoia.de/software/archivemount.html
url :
	 https://www.cybernoia.de/software/archivemount/archivemount-0.8.12.tar.gz
description :
	 File system for accessing archives using libarchive
build_deps :
	 pkg-config
link_deps :
	 libarchive
	 :osxfuse
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
