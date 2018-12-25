name :
	 Libmatio
homepage :
	 https://matio.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/matio/matio/1.5.12/matio-1.5.12.tar.gz
description :
	 C library for reading and writing MATLAB MAT files
build_deps :
link_deps :
	 hdf5
optional_deps :
conflicts :
resource :
	 ['test_mat_file']
	 ['https://web.uvic.ca/~monahana/eos225/poc_data.mat.sfx']
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-extended-sparse=yes
	 --enable-mat73=yes
	 --with-hdf5=#{Formula["hdf5"].opt_prefix}
	 --with-zlib=/usr
	 ]
	 system "./configure", *args
	 system "make", "install"
