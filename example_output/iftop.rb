name :
	 Iftop
homepage :
	 http://www.ex-parrot.com/~pdw/iftop/
url :
	 http://www.ex-parrot.com/pdw/iftop/download/iftop-1.0pre4.tar.gz
description :
	 Display an interface's bandwidth usage
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
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
