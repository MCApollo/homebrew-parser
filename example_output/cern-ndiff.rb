name :
	 CernNdiff
homepage :
	 https://mad.web.cern.ch/mad/
url :
	 https://github.com/MethodicalAcceleratorDesign/MAD-X/archive/v5.04.02.tar.gz
description :
	 Numerical diff tool
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "tools/numdiff" do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
