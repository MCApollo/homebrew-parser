name :
	 Texi2html
homepage :
	 https://www.nongnu.org/texi2html/
url :
	 https://download.savannah.gnu.org/releases/texi2html/texi2html-5.0.tar.gz
description :
	 Convert TeXinfo files to HTML
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
	 "--mandir=#{man}", "--infodir=#{info}"
	 chmod 0755, "./install-sh"
	 system "make", "install"
