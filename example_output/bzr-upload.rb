name :
	 BzrUpload
homepage :
	 https://launchpad.net/bzr-upload
url :
	 https://launchpad.net/bzr-upload/1.1/1.1.0/+download/bzr-upload-1.1.0.tar.gz
description :
	 Bazaar plugin to incrementally upload changes to a dumb server
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
	 (share/"bazaar/plugins/upload").install Dir["*"]
