name :
	 Libxo
homepage :
	 https://juniper.github.io/libxo/libxo-manual.html
url :
	 https://github.com/Juniper/libxo/releases/download/0.9.0/libxo-0.9.0.tar.gz
description :
	 Allows an application to generate text, XML, JSON, and HTML output
build_deps :
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
