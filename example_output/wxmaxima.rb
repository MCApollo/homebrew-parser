name :
	 Wxmaxima
homepage :
	 https://wxmaxima-developers.github.io/wxmaxima/
url :
	 https://github.com/wxMaxima-developers/wxmaxima/archive/Version-18.11.4.tar.gz
description :
	 Cross platform GUI for Maxima
build_deps :
	 cmake
	 gettext
link_deps :
	 wxmac
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 prefix.install "wxMaxima.app"
