name :
	 Recoverjpeg
homepage :
	 https://www.rfc1149.net/devel/recoverjpeg.html
url :
	 https://www.rfc1149.net/download/recoverjpeg/recoverjpeg-2.6.2.tar.gz
description :
	 Tool to recover JPEG images from a file system image
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
