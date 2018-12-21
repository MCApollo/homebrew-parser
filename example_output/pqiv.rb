name :
	 Pqiv
homepage :
	 https://github.com/phillipberndt/pqiv
url :
	 https://github.com/phillipberndt/pqiv/archive/2.11.tar.gz
description :
	 Powerful image viewer with minimal UI
build_deps :
	 pkg-config
link_deps :
	 gtk+3
	 imagemagick
	 libarchive
	 libspectre
	 poppler
	 webp
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
