name :
	 RbenvCommunalGems
homepage :
	 https://github.com/tpope/rbenv-communal-gems
url :
	 https://github.com/tpope/rbenv-communal-gems/archive/v1.0.1.tar.gz
description :
	 Share gems across multiple rbenv Ruby installs
build_deps :
link_deps :
	 rbenv
conflicts :
patches :
EOF_patch :
install :
	 prefix.install Dir["*"]
