name :
	 Regldg
homepage :
	 https://regldg.com/
url :
	 https://regldg.com/regldg-1.0.0.tar.gz
description :
	 Regular expression grammar language dictionary generator
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
	 bin.install "regldg"
