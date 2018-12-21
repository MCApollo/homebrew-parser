name :
	 Qrencode
homepage :
	 https://fukuchi.org/works/qrencode/index.html.en
url :
	 https://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz
description :
	 QR Code generation
build_deps :
	 pkg-config
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
