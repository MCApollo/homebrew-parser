name :
	 BzrExtmerge
homepage :
	 https://launchpad.net/bzr-extmerge
url :
	 https://launchpad.net/bzr-extmerge/trunk/1.0.0/+download/bzr-extmerge-1.0.0.tar.gz
description :
	 External merge tool support for Bazaar
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
	 (share/"bazaar/plugins/extmerge").install Dir["*"]
