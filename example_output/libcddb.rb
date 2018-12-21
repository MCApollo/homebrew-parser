name :
	 Libcddb
homepage :
	 https://libcddb.sourceforge.io/
url :
	 https://downloads.sourceforge.net/libcddb/libcddb-1.3.2.tar.bz2
description :
	 CDDB server access library
build_deps :
	 pkg-config
link_deps :
	 libcdio
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :yosemite && MacOS::Xcode.installed? && MacOS::Xcode.version >= "7.0"
	 ENV.delete("SDKROOT")
