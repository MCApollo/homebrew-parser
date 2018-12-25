name :
	 Pth
homepage :
	 https://www.gnu.org/software/pth/
url :
	 https://ftp.gnu.org/gnu/pth/pth-2.0.7.tar.gz
description :
	 GNU Portable THreads
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
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "test"
	 system "make", "install"
