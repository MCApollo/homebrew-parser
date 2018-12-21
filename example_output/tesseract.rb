name :
	 Tesseract
homepage :
	 https://github.com/tesseract-ocr/
url :
	 https://github.com/tesseract-ocr/tesseract/archive/4.0.0.tar.gz
description :
	 OCR (Optical Character Recognition) engine
build_deps :
	 autoconf
	 autoconf-archive
	 automake
	 libtool
	 pkg-config
	 libtool
link_deps :
	 leptonica
	 libtiff
	 icu4c
	 glib
	 cairo
	 pango
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 if build.with? "training-tools"
	 icu4c = Formula["icu4c"]
	 ENV.append "CFLAGS", "-I#{icu4c.opt_include}"
	 ENV.append "LDFLAGS", "-L#{icu4c.opt_lib}"
