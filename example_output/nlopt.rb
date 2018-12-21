name :
	 Nlopt
homepage :
	 https://nlopt.readthedocs.io/
url :
	 https://github.com/stevengj/nlopt/releases/download/nlopt-2.4.2/nlopt-2.4.2.tar.gz
description :
	 Free/open-source library for nonlinear optimization
build_deps :
link_deps :
	 numpy
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 if build.head?
	 system "cmake", ".", *std_cmake_args,
	 "-DBUILD_MATLAB=OFF",
	 "-DBUILD_OCTAVE=OFF",
	 "-DWITH_CXX=ON"
	 else
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-shared",
	 "--with-cxx",
	 "--without-octave"
	 system "make"
