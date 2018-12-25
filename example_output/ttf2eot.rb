name :
	 Ttf2eot
homepage :
	 https://github.com/wget/ttf2eot
url :
	 https://github.com/wget/ttf2eot/archive/v0.0.3.tar.gz
description :
	 Convert TTF files to EOT
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
	 bin.install "ttf2eot"
