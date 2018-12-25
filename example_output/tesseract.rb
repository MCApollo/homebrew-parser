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
optional_deps :
conflicts :
resource :
	 ['tessdata', 'eng', 'osd', 'snum']
	 ['https://github.com/tesseract-ocr/tessdata_fast/archive/4.0.0.tar.gz', 'https://github.com/tesseract-ocr/tessdata_fast/raw/4.0.0/eng.traineddata', 'https://github.com/tesseract-ocr/tessdata_fast/raw/4.0.0/osd.traineddata', 'https://github.com/USCDataScience/counterfeit-electronics-tesseract/raw/319a6eeacff181dad5c02f3e7a3aff804eaadeca/Training%20Tesseract/snum.traineddata']
patches :
EOF_patch :
install :
	 if build.with? "training-tools"
	 icu4c = Formula["icu4c"]
	 ENV.append "CFLAGS", "-I#{icu4c.opt_include}"
	 ENV.append "LDFLAGS", "-L#{icu4c.opt_lib}"
	 end
	 ENV["LIBLEPT_HEADERSDIR"] = HOMEBREW_PREFIX/"include"
	 ENV.cxx11
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
	 if build.with? "serial-num-pack"
	 resource("snum").stage { mv "snum.traineddata", share/"tessdata" }
	 end
	 if build.with? "training-tools"
	 system "make", "training"
	 system "make", "training-install"
	 end
	 if build.with? "all-languages"
	 resource("tessdata").stage { mv Dir["*"], share/"tessdata" }
	 else
	 resource("eng").stage { mv "eng.traineddata", share/"tessdata" }
	 resource("osd").stage { mv "osd.traineddata", share/"tessdata" }
	 end
