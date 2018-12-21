name :
	 Irrtoolset
homepage :
	 https://github.com/irrtoolset/irrtoolset
url :
	 https://ftp.isc.org/isc/IRRToolSet/IRRToolSet-5.0.1/irrtoolset-5.0.1.tar.gz
description :
	 Tools to work with Internet routing policies
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "glibtoolize"
	 system "autoreconf", "-i"
