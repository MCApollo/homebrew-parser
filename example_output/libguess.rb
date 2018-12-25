name :
	 Libguess
homepage :
	 http://atheme.org/projects/libguess.html
url :
	 http://rabbit.dereferenced.org/~nenolod/distfiles/libguess-1.2.tar.bz2
description :
	 Character set guessing library
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
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
