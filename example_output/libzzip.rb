name :
	 Libzzip
homepage :
	 https://github.com/gdraheim/zziplib
url :
	 https://github.com/gdraheim/zziplib/archive/v0.13.69.tar.gz
description :
	 Library providing read access on ZIP-archives
build_deps :
	 pkg-config
	 xmlto
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 args = %W[
	 --without-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
