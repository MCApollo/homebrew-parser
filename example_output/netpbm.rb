name :
	 Netpbm
homepage :
	 https://netpbm.sourceforge.io/
url :
	 http://svn.code.sf.net/p/netpbm/code/stable
description :
	 Image manipulation
build_deps :
link_deps :
	 jasper
	 jpeg
	 libpng
	 libtiff
conflicts :
	 jbigkit
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
