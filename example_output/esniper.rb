name :
	 Esniper
homepage :
	 https://sourceforge.net/projects/esniper/
url :
	 https://downloads.sourceforge.net/project/esniper/esniper/2.35.0/esniper-2-35-0.tgz
description :
	 Snipe eBay auctions from the command-line
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
