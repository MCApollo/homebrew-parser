name :
	 Dcm2niix
homepage :
	 https://www.nitrc.org/plugins/mwiki/index.php/dcm2nii:MainPage
url :
	 https://github.com/rordenlab/dcm2niix/archive/v1.0.20181125.tar.gz
description :
	 DICOM to NIfTI converter
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
