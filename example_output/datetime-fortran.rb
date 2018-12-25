name :
	 DatetimeFortran
homepage :
	 https://github.com/wavebitscientific/datetime-fortran
url :
	 https://github.com/wavebitscientific/datetime-fortran/releases/download/v1.6.0/datetime-fortran-1.6.0.tar.gz
description :
	 Fortran time and date manipulation library
build_deps :
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-silent-rules"
	 system "make", "install"
	 (pkgshare/"test").install "src/tests/datetime_tests.f90"
