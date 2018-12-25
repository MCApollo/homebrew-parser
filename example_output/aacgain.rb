name :
	 Aacgain
homepage :
	 https://aacgain.altosdesign.com/
url :
	 https://aacgain.altosdesign.com/alvarez/aacgain-1.8.tar.bz2
description :
	 AAC-supporting version of mp3gain
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
	 "--prefix=#{prefix}"
	 system "make", "install"
