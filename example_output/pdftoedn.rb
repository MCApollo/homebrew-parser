name :
	 Pdftoedn
homepage :
	 https://github.com/edporras/pdftoedn
url :
	 https://github.com/edporras/pdftoedn/archive/v0.36.3.tar.gz
description :
	 Extract PDF document data and save the output in EDN format
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 boost
	 freetype
	 leptonica
	 libpng
	 openssl
	 poppler
	 rapidjson
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "autoreconf", "-i"
	 system "./configure", "--with-openssl=#{Formula["openssl"].opt_prefix}", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
