name :
	 Gpsbabel
homepage :
	 https://www.gpsbabel.org/
url :
	 https://github.com/gpsbabel/gpsbabel/archive/gpsbabel_1_5_4.tar.gz
description :
	 Converts/uploads GPS waypoints, tracks, and routes
build_deps :
link_deps :
	 qt
optional_deps :
	 libusb
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/gpsbabel/gpsbabel/commit/b7365b93.patch?full_index=1
	 https://raw.githubusercontent.com/Homebrew/formula-patches/ca4c4730/gpsbabel/qt5.10.patch
EOF_patch :
install :
	 ENV.cxx11
	 args = ["--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"]
	 args << "--without-libusb" if build.without? "libusb"
	 system "./configure", *args
	 system "make", "install"
