name :
	 Jbig2dec
homepage :
	 https://jbig2dec.com/
url :
	 https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs924/jbig2dec-0.15.tar.gz
description :
	 JBIG2 decoder and library (for monochrome documents)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['test']
	 ['https://github.com/apache/tika/raw/master/tika-parsers/src/test/resources/test-documents/testJBIG2.jb2']
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-silent-rules
	 --without-libpng
	 ]
	 system "./configure", *args
	 system "make", "install"
