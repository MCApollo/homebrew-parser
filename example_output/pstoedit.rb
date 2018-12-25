name :
	 Pstoedit
homepage :
	 http://www.pstoedit.net/
url :
	 https://downloads.sourceforge.net/project/pstoedit/pstoedit/3.73/pstoedit-3.73.tar.gz
description :
	 Convert PostScript and PDF files to editable vector graphics
build_deps :
	 pkg-config
link_deps :
	 ghostscript
	 imagemagick
	 plotutils
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
