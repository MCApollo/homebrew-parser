name :
	 Logentries
homepage :
	 https://logentries.com/doc/agent/
url :
	 https://github.com/rapid7/le/archive/v1.4.43.tar.gz
description :
	 Utility for access to logentries logging infrastructure
build_deps :
link_deps :
	 python@2
conflicts :
	 le
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
