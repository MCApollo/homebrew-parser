name :
	 Cimg
homepage :
	 http://cimg.eu/
url :
	 http://cimg.eu/files/CImg_2.3.6.zip
description :
	 C++ toolkit for image processing
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 include.install "CImg.h"
	 prefix.install "Licence_CeCILL-C_V1-en.txt", "Licence_CeCILL_V2-en.txt"
	 pkgshare.install "examples", "plugins"
