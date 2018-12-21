name :
	 Gitfs
homepage :
	 https://www.presslabs.com/gitfs
url :
	 https://github.com/PressLabs/gitfs/archive/0.4.5.1.tar.gz
description :
	 Version controlled file system
build_deps :
link_deps :
	 libgit2
	 :osxfuse
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
