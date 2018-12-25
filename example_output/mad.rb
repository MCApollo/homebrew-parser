name :
	 Mad
homepage :
	 https://www.underbit.com/products/mad/
url :
	 https://downloads.sourceforge.net/project/mad/libmad/0.15.1b/libmad-0.15.1b.tar.gz
description :
	 MPEG audio decoder
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
	 fpm = MacOS.prefer_64_bit? ? "64bit": "intel"
	 system "./configure", "--disable-debugging", "--enable-fpm=#{fpm}", "--prefix=#{prefix}"
	 system "make", "CFLAGS=#{ENV.cflags}", "LDFLAGS=#{ENV.ldflags}", "install"
	 (lib+"pkgconfig/mad.pc").write pc_file
