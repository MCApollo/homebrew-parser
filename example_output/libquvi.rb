name :
	 Libquvi
homepage :
	 https://quvi.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/quvi/0.4/libquvi/libquvi-0.4.1.tar.bz2
description :
	 C library to parse flash media stream properties
build_deps :
	 pkg-config
link_deps :
	 lua@5.1
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["lua@5.1"].opt_libexec/"lib/pkgconfig"
	 scripts = prefix/"libquvi-scripts"
	 resource("scripts").stage do
	 system "./configure", "--prefix=#{scripts}", "--with-nsfw"
	 system "make", "install"
