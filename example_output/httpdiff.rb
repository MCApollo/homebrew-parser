name :
	 Httpdiff
homepage :
	 https://github.com/jgrahamc/httpdiff
url :
	 https://github.com/jgrahamc/httpdiff/archive/v1.0.0.tar.gz
description :
	 Compare two HTTP(S) responses
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "go", "build", "-o", bin/"httpdiff"
