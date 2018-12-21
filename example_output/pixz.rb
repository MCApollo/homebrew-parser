name :
	 Pixz
homepage :
	 https://github.com/vasi/pixz
url :
	 https://github.com/vasi/pixz/releases/download/v1.0.6/pixz-1.0.6.tar.gz
description :
	 Parallel, indexed, xz compressor
build_deps :
	 asciidoc
	 docbook
	 pkg-config
link_deps :
	 libarchive
	 xz
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["libarchive"].opt_lib/"pkgconfig"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "a2x", "--doctype", "manpage", "--format", "manpage", "src/pixz.1.asciidoc"
	 man1.install "src/pixz.1"
