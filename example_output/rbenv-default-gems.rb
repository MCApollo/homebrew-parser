name :
	 RbenvDefaultGems
homepage :
	 https://github.com/sstephenson/rbenv-default-gems
url :
	 https://github.com/sstephenson/rbenv-default-gems/archive/v1.0.0.tar.gz
description :
	 Auto-installs gems for Ruby installs
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
	 prefix.install Dir["*"]
