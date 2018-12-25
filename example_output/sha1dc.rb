name :
	 Sha1dc
homepage :
	 https://github.com/cr-marcstevens/sha1collisiondetection
url :
	 https://github.com/cr-marcstevens/sha1collisiondetection/archive/stable-v1.0.3.tar.gz
description :
	 Tool to detect SHA-1 collisions in files, including SHAttered
build_deps :
	 coreutils
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "INSTALL=ginstall", "PREFIX=#{prefix}", "install"
	 (pkgshare/"test").install Dir["test/*"]
