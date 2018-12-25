name :
	 Simg2img
homepage :
	 https://github.com/anestisb/android-simg2img
url :
	 https://github.com/anestisb/android-simg2img/archive/1.1.3.tar.gz
description :
	 Tool to convert Android sparse images to raw images and back
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
	 system "make", "PREFIX=#{prefix}", "install"
