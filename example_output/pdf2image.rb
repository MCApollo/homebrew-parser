name :
	 Pdf2image
homepage :
	 https://code.google.com/p/pdf2image/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pdf2image/pdf2image-0.53-source.tar.gz
description :
	 Convert PDFs to images
build_deps :
link_deps :
	 freetype
	 ghostscript
	 :x11
optional_deps :
conflicts :
	 poppler
	 xpdf
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 inreplace "Makefile", "/man/", "/share/man/"
	 inreplace "src/Makefile", "$(srcdir)", "$(SRCDIR)"
	 inreplace ["src/Makefile", "xpdf/Makefile"],
	 "LDFLAGS =", "LDFLAGS=-L#{MacOS::X11.lib}"
	 system "make"
	 system "make", "install"
