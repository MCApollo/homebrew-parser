name :
	 Tarsnapper
homepage :
	 https://github.com/miracle2k/tarsnapper
url :
	 https://github.com/miracle2k/tarsnapper/archive/0.4.tar.gz
description :
	 Tarsnap wrapper which expires backups using a gfs-scheme
build_deps :
link_deps :
	 python
	 tarsnap
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
