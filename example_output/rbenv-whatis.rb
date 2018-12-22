name :
	 RbenvWhatis
homepage :
	 https://github.com/rkh/rbenv-whatis
url :
	 https://github.com/rkh/rbenv-whatis/archive/v1.0.0.tar.gz
description :
	 Resolves abbreviations and aliases to Ruby versions
build_deps :
link_deps :
	 rbenv
conflicts :
patches :
EOF_patch :
install :
	 prefix.install Dir["*"]
