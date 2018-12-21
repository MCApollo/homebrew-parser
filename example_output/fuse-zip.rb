name :
	 FuseZip
homepage :
	 https://bitbucket.org/agalanin/fuse-zip
url :
	 https://bitbucket.org/agalanin/fuse-zip/downloads/fuse-zip-0.4.5.tar.gz
description :
	 FUSE file system to create & manipulate ZIP archives
build_deps :
	 pkg-config
link_deps :
	 libzip
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "install"
