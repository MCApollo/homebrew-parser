name :
	 Z3
homepage :
	 https://github.com/Z3Prover/z3
url :
	 https://github.com/Z3Prover/z3/archive/z3-4.8.3.tar.gz
description :
	 High-performance theorem prover
build_deps :
link_deps :
	 python@2
	 python
conflicts :
patches :
EOF_patch :
install :
	 if build.without?("python") && build.without?("python@2")
	 odie "z3: --with-python must be specified when using --without-python@2"
