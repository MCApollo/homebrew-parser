name :
	 Libpointing
homepage :
	 https://github.com/INRIA/libpointing
url :
	 https://github.com/INRIA/libpointing/releases/download/v1.0.7/libpointing-mac-1.0.7.tar.gz
description :
	 Provides direct access to HID pointing devices
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
