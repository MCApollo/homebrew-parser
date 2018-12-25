name :
	 Epeg
homepage :
	 https://github.com/mattes/epeg
url :
	 https://github.com/mattes/epeg/archive/v0.9.2.tar.gz
description :
	 JPEG/JPG thumbnail scaling
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 jpeg
	 libexif
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
