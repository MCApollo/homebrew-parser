name :
	 Mmsrip
homepage :
	 https://nbenoit.tuxfamily.org/index.php?page=MMSRIP
url :
	 https://nbenoit.tuxfamily.org/projects/mmsrip/mmsrip-0.7.0.tar.gz
description :
	 Client for the MMS:// protocol
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"
