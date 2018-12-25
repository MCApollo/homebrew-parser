name :
	 Swfmill
homepage :
	 https://swfmill.org
url :
	 https://www.swfmill.org/releases/swfmill-0.3.6.tar.gz
description :
	 xml2swf and swf2xml processor
build_deps :
	 pkg-config
link_deps :
	 freetype
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
