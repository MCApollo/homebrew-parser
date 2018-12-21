name :
	 TrashCli
homepage :
	 https://github.com/andreafrancia/trash-cli
url :
	 https://github.com/andreafrancia/trash-cli/archive/0.17.1.14.tar.gz
description :
	 Command-line interface to the freedesktop.org trashcan
build_deps :
link_deps :
	 python
conflicts :
	 trash
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
