name :
	 Tmpwatch
homepage :
	 https://pagure.io/tmpwatch
url :
	 https://releases.pagure.org/tmpwatch/tmpwatch-2.11.tar.bz2
description :
	 Find and remove files not accessed in a specified time
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
