name :
	 Grace
homepage :
	 http://plasma-gate.weizmann.ac.il/Grace/
url :
	 https://mirrors.kernel.org/debian/pool/main/g/grace/grace_5.1.25.orig.tar.gz
description :
	 WYSIWYG 2D plotting tool for X11
build_deps :
link_deps :
	 fftw
	 jpeg
	 libpng
	 openmotif
	 pdflib-lite
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.O1
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--enable-grace-home=#{prefix}"
	 system "make", "install"
	 share.install "fonts", "examples"
	 man1.install Dir["doc/*.1"]
	 doc.install Dir["doc/*"]
