name :
	 Faac
homepage :
	 https://www.audiocoding.com/faac.html
url :
	 https://downloads.sourceforge.net/project/faac/faac-src/faac-1.29/faac-1.29.9.2.tar.gz
description :
	 ISO AAC audio encoder
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
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
