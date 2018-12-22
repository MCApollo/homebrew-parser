name :
	 BzrRewrite
homepage :
	 https://launchpad.net/bzr-rewrite
url :
	 https://launchpad.net/bzr-rewrite/trunk/0.6.3/+download/bzr-rewrite-0.6.3.tar.gz
description :
	 Bazaar plugin to support rewriting revisions and rebasing
build_deps :
link_deps :
	 bazaar
conflicts :
patches :
EOF_patch :
install :
	 (share/"bazaar/plugins/rewrite").install Dir["*"]
