name :
	 Pdfsandwich
homepage :
	 http://www.tobias-elze.de/pdfsandwich/
url :
	 https://downloads.sourceforge.net/project/pdfsandwich/pdfsandwich%200.1.7/pdfsandwich-0.1.7.tar.bz2
description :
	 Generate sandwich OCR PDFs from scanned file
build_deps :
	 gawk
	 ocaml
link_deps :
	 exact-image
	 ghostscript
	 imagemagick
	 poppler
	 tesseract
	 unpaper
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 bin.env_script_all_files(libexec/"bin", :PATH => "#{Formula["poppler"].opt_bin}:$PATH")
