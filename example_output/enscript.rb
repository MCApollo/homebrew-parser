name :
	 Enscript
homepage :
	 https://www.gnu.org/software/enscript/
url :
	 https://ftp.gnu.org/gnu/enscript/enscript-1.6.6.tar.gz
description :
	 Convert text to Postscript, HTML, or RTF, with syntax highlighting
build_deps :
link_deps :
	 gettext
optional_deps :
conflicts :
	 cspice
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
