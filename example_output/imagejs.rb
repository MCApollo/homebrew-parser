name :
	 Imagejs
homepage :
	 https://jklmnn.de/imagejs/
url :
	 https://github.com/jklmnn/imagejs/archive/0.7.2.tar.gz
description :
	 Tool to hide JavaScript inside valid image files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "imagejs"
