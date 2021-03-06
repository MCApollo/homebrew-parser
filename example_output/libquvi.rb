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
optional_deps :
conflicts :
resource :
	 ['scripts']
	 ['https://downloads.sourceforge.net/project/quvi/0.4/libquvi-scripts/libquvi-scripts-0.4.14.tar.xz']
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["lua@5.1"].opt_libexec/"lib/pkgconfig"
	 scripts = prefix/"libquvi-scripts"
	 resource("scripts").stage do
	 system "./configure", "--prefix=#{scripts}", "--with-nsfw"
	 system "make", "install"
	 end
	 ENV.append_path "PKG_CONFIG_PATH", "#{scripts}/lib/pkgconfig"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
