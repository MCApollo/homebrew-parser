name :
	 Libaacs
homepage :
	 https://www.videolan.org/developers/libaacs.html
url :
	 https://download.videolan.org/pub/videolan/libaacs/0.9.0/libaacs-0.9.0.tar.bz2
description :
	 Implements the Advanced Access Content System specification
build_deps :
	 bison
link_deps :
	 libgcrypt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
