name :
	 JpegArchive
homepage :
	 https://github.com/danielgtaylor/jpeg-archive
url :
	 https://github.com/danielgtaylor/jpeg-archive/archive/v2.2.0.tar.gz
description :
	 Utilities for archiving JPEGs for long term storage
build_deps :
link_deps :
	 mozjpeg
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
