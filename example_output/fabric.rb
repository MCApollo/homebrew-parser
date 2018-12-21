name :
	 Fabric
homepage :
	 https://www.fabfile.org/
url :
	 https://github.com/fabric/fabric/archive/2.4.0.tar.gz
description :
	 Library and command-line tool for SSH
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
