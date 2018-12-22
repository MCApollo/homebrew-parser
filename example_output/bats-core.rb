name :
	 BatsCore
homepage :
	 https://github.com/bats-core/bats-core
url :
	 https://github.com/bats-core/bats-core/archive/v1.1.0.tar.gz
description :
	 Bash Automated Testing System
build_deps :
link_deps :
conflicts :
	 bats
patches :
EOF_patch :
install :
	 system "./install.sh", prefix
