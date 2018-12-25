name :
	 Dps8m
homepage :
	 https://ringzero.wikidot.com
url :
	 https://downloads.sourceforge.net/project/dps8m/Release%201.0/source.tgz
description :
	 Simulator for the Multics dps-8/m mainframe
build_deps :
link_deps :
	 libuv
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.mkpath
	 system "make", "INSTALL_ROOT=#{prefix}", "install"
