name :
	 Id3tool
homepage :
	 http://nekohako.xware.cx/id3tool/
url :
	 http://nekohako.xware.cx/id3tool/id3tool-1.2a.tar.gz
description :
	 ID3 editing tool
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
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
