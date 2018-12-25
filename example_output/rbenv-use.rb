name :
	 RbenvUse
homepage :
	 https://github.com/rkh/rbenv-use
url :
	 https://github.com/rkh/rbenv-use/archive/v1.0.0.tar.gz
description :
	 Switch between rubies without reference to patch levels
build_deps :
link_deps :
	 rbenv
	 rbenv-whatis
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 prefix.install Dir["*"]
