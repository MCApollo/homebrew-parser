name :
	 BzrXmloutput
homepage :
	 https://launchpad.net/bzr-xmloutput
url :
	 https://launchpad.net/bzr-xmloutput/trunk/0.8.8/+download/bzr-xmloutput-0.8.8.tar.gz
description :
	 Bazaar plugin that provides a option to generate XML output
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
	 (share/"bazaar/plugins/xmloutput").install Dir["*"]
