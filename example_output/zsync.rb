name :
	 Zsync
homepage :
	 http://zsync.moria.org.uk/
url :
	 http://zsync.moria.org.uk/download/zsync-0.6.2.tar.bz2
description :
	 File transfer program
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
