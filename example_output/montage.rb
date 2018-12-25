name :
	 Montage
homepage :
	 http://montage.ipac.caltech.edu
url :
	 http://montage.ipac.caltech.edu/download/Montage_v4.0.tar.gz
description :
	 Toolkit for assembling FITS images into custom mosaics
build_deps :
link_deps :
optional_deps :
conflicts :
	 wdiff
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install Dir["bin/m*"]
