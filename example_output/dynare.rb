name :
	 Dynare
homepage :
	 https://www.dynare.org/
url :
	 https://www.dynare.org/release/source/dynare-4.5.6.tar.xz
description :
	 Platform for economic models, particularly DSGE and OLG models
build_deps :
	 boost
	 cweb
link_deps :
	 fftw
	 gcc
	 gsl
	 hdf5
	 libmatio
	 metis
	 octave
	 suite-sparse
	 veclibfort
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 resource("slicot").stage do
	 system "make", "lib", "OPTS=-fPIC", "SLICOTLIB=../libslicot_pic.a",
	 "FORTRAN=gfortran", "LOADER=gfortran"
	 system "make", "clean"
	 system "make", "lib", "OPTS=-fPIC -fdefault-integer-8",
	 "FORTRAN=gfortran", "LOADER=gfortran",
	 "SLICOTLIB=../libslicot64_pic.a"
	 (buildpath/"slicot").install "libslicot_pic.a", "libslicot64_pic.a"
