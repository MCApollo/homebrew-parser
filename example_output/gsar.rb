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
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "gsar"
