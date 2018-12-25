name :
	 Tre
homepage :
	 https://laurikari.net/tre/
url :
	 https://laurikari.net/tre/tre-0.8.0.tar.bz2
description :
	 Lightweight, POSIX-compliant regular expression (regex) library
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
