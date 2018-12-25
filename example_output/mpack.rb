name :
	 Mpack
homepage :
	 http://ftp.andrew.cmu.edu/pub/mpack/
url :
	 http://ftp.andrew.cmu.edu/pub/mpack/mpack-1.6.tar.gz
description :
	 MIME mail packing and unpacking
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/1ad38a9c/mpack/uudecode.c.patch
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
