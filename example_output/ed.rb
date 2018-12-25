name :
	 Ed
homepage :
	 https://www.gnu.org/software/ed/ed.html
url :
	 https://ftp.gnu.org/gnu/ed/ed-1.14.2.tar.lz
description :
	 Classic UNIX line editor
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
	 ENV.deparallelize
	 args = ["--prefix=#{prefix}"]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
