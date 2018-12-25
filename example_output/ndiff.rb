name :
	 Ndiff
homepage :
	 https://www.math.utah.edu/~beebe/software/ndiff/
url :
	 http://ftp.math.utah.edu/pub/misc/ndiff-2.00.tar.gz
description :
	 Virtual package provided by nmap
build_deps :
link_deps :
optional_deps :
conflicts :
	 nmap
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=.", "--mandir=."
	 mkpath "bin"
	 mkpath "man/man1"
	 system "make", "install"
	 bin.install "bin/ndiff"
	 man1.install "man/man1/ndiff.1"
