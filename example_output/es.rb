name :
	 Es
homepage :
	 https://wryun.github.io/es-shell/
url :
	 https://github.com/wryun/es-shell/releases/download/v0.9.1/es-0.9.1.tar.gz
description :
	 Extensible shell with first class functions, lexical scoping, and more
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
	 system "./configure", "--prefix=#{prefix}", "--with-editline"
	 system "make"
	 bin.install "es"
	 doc.install %w[CHANGES README trip.es examples]
	 man1.install "doc/es.1"
