name :
	 Dcmtk
homepage :
	 https://dicom.offis.de/dcmtk.php.en
url :
	 https://dicom.offis.de/download/dcmtk/dcmtk363/dcmtk-3.6.3.tar.gz
description :
	 OFFIS DICOM toolkit command-line utilities
build_deps :
	 cmake
link_deps :
	 libpng
	 libtiff
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", *std_cmake_args, ".."
	 system "make", "install"
	 end
