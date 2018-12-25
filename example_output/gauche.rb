name :
	 Gauche
homepage :
	 https://practical-scheme.net/gauche/
url :
	 https://downloads.sourceforge.net/gauche/Gauche/Gauche-0.9.6.tgz
description :
	 R7RS Scheme implementation, developed to be a handy script interpreter
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
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking",
	 "--enable-multibyte=utf-8"
	 system "make"
	 system "make", "check"
	 system "make", "install"
