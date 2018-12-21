name :
	 Odo
homepage :
	 https://github.com/atomicobject/odo
url :
	 https://github.com/atomicobject/odo/archive/v0.2.2.tar.gz
description :
	 Atomic odometer for the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 man1.mkpath
	 bin.mkpath
	 system "make", "test"
	 system "make", "install", "PREFIX=#{prefix}"
