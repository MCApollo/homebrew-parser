name :
	 BzrExternals
homepage :
	 https://launchpad.net/bzr-externals
url :
	 https://launchpad.net/bzr-externals/trunk/1.3.3/+download/bzr-externals-1.3.3.tar.gz
description :
	 Bazaar support for external branches like svn:externals
build_deps :
link_deps :
	 bazaar
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 (share/"bazaar/plugins/externals").install Dir["*"]
