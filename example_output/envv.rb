name :
	 Envv
homepage :
	 https://github.com/jakewendt/envv#readme
url :
	 https://github.com/jakewendt/envv/archive/v1.7.tar.gz
description :
	 Shell-independent handling of environment variables
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "envv"
	 man1.install "envv.1"
