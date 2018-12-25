name :
	 Mftrace
homepage :
	 http://lilypond.org/mftrace/
url :
	 http://lilypond.org/downloads/sources/mftrace/mftrace-1.2.19.tar.gz
description :
	 Trace TeX bitmap font to PFA, PFB, or TTF font
build_deps :
link_deps :
	 fontforge
	 potrace
	 t1utils
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
