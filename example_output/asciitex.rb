name :
	 Asciitex
homepage :
	 https://asciitex.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/asciitex/asciiTeX-0.21.tar.gz
description :
	 Generate ASCII-art representations of mathematical equations
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
	 system "./configure", "--prefix=#{prefix}", "--disable-gtk"
	 inreplace "Makefile", "man/asciiTeX_gui.1", ""
	 system "make", "install"
	 pkgshare.install "EXAMPLES"
