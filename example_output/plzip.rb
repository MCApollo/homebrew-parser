name :
	 Plzip
homepage :
	 https://www.nongnu.org/lzip/plzip.html
url :
	 https://download.savannah.gnu.org/releases/lzip/plzip/plzip-1.7.tar.gz
description :
	 Data compressor
build_deps :
link_deps :
	 lzlib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/68e2af8/plzip/pthread.diff
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 ENV.deparallelize
	 system "make", "install"
