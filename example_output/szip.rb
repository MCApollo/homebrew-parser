name :
	 Szip
homepage :
	 https://support.hdfgroup.org/HDF5/release/obtain5.html#extlibs
url :
	 https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz
description :
	 Implementation of extended-Rice lossless compression algorithm
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
