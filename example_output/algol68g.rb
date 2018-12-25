name :
	 Algol68g
homepage :
	 https://jmvdveer.home.xs4all.nl/algol.html
url :
	 https://jmvdveer.home.xs4all.nl/algol68g-2.8.4.tar.gz
description :
	 Algol 68 compiler-interpreter
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
