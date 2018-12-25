name :
	 Openexr
homepage :
	 https://www.openexr.com/
url :
	 https://savannah.nongnu.org/download/openexr/openexr-2.2.0.tar.gz
description :
	 High dynamic-range image file format
build_deps :
	 pkg-config
link_deps :
	 ilmbase
optional_deps :
conflicts :
resource :
	 ['exr']
	 ['https://github.com/openexr/openexr-images/raw/master/TestImages/AllHalfValues.exr']
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/f1a3ea4f69b7a54d8123e2f16488864d52202de8/openexr/64bit_types.patch
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
