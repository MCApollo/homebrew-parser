name :
	 Ccd2iso
homepage :
	 https://ccd2iso.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ccd2iso/ccd2iso/ccd2iso-0.3/ccd2iso-0.3.tar.gz
description :
	 Convert CloneCD images to ISO images
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
