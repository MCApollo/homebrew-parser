name :
	 Certigo
homepage :
	 https://github.com/square/certigo
url :
	 https://github.com/square/certigo/archive/v1.11.0.tar.gz
description :
	 Utility to examine and validate certificates in a variety of formats
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./build"
	 bin.install "bin/certigo"
