name :
	 Libcdio
homepage :
	 https://www.gnu.org/software/libcdio/
url :
	 https://ftp.gnu.org/gnu/libcdio/libcdio-2.0.0.tar.gz
description :
	 Compact Disc Input and Control Library
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
