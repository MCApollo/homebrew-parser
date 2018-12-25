name :
	 Parallel
homepage :
	 https://savannah.gnu.org/projects/parallel/
url :
	 https://ftp.gnu.org/gnu/parallel/parallel-20181122.tar.bz2
description :
	 Shell command parallelization utility
build_deps :
link_deps :
optional_deps :
conflicts :
	 moreutils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
