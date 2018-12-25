name :
	 Libexif
homepage :
	 https://libexif.github.io/
url :
	 https://downloads.sourceforge.net/project/libexif/libexif/0.6.21/libexif-0.6.21.tar.gz
description :
	 EXIF parsing library
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
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
