name :
	 Mp3unicode
homepage :
	 https://mp3unicode.sourceforge.io/
url :
	 https://github.com/downloads/alonbl/mp3unicode/mp3unicode-1.2.1.tar.bz2
description :
	 Command-line utility to convert mp3 tags between different encodings
build_deps :
	 pkg-config
link_deps :
	 taglib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "ICONV_LIBS", "-liconv"
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
