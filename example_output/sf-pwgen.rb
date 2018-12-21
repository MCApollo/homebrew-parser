name :
	 SfPwgen
homepage :
	 https://github.com/anders/pwgen/
url :
	 https://github.com/anders/pwgen/archive/v1.4.tar.gz
description :
	 Generate passwords using SecurityFoundation framework
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "sf-pwgen"
