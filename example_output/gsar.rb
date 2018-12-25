name :
	 Gsar
homepage :
	 http://tjaberg.com/
url :
	 http://tjaberg.com/gsar121.zip
description :
	 General Search And Replace on files
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
	 bin.install "gsar"
