name :
	 BzrColo
homepage :
	 https://launchpad.net/bzr-colo
url :
	 https://launchpad.net/bzr-colo/trunk/0.4.0/+download/bzr-colo-0.4.0.tar.gz
description :
	 Git style colocated branches for Bazaar
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
	 (share/"bazaar/plugins/colo").install Dir["*"]
