name :
	 Bzrtools
homepage :
	 http://wiki.bazaar.canonical.com/BzrTools
url :
	 https://launchpad.net/bzrtools/stable/2.6.0/+download/bzrtools-2.6.0.tar.gz
description :
	 Bazaar plugin that supplies useful additional utilities
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
	 (share/"bazaar/plugins/bzrtools").install Dir["*"]
