name :
	 Kimwituxx
homepage :
	 https://www2.informatik.hu-berlin.de/sam/kimwitu++/
url :
	 https://download.savannah.gnu.org/releases/kimwitu-pp/kimwitu++-2.3.13.tar.gz
description :
	 Tool for processing trees (i.e. terms)
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
