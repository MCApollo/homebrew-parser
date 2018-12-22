name :
	 BzrBuilder
homepage :
	 https://launchpad.net/bzr-builder
url :
	 https://launchpad.net/bzr-builder/trunk/0.7.3/+download/bzr-builder-0.7.3.tar.gz
description :
	 Bazaar plugin to construct a branch based on a recipe
build_deps :
link_deps :
	 bazaar
conflicts :
patches :
EOF_patch :
install :
	 (share/"bazaar/plugins/builder").install Dir["*"]
