name :
	 Pcapplusplus
homepage :
	 https://seladb.github.io/PcapPlusPlus-Doc
url :
	 https://github.com/seladb/PcapPlusPlus/archive/v18.08.tar.gz
description :
	 C++ network sniffing, packet parsing and crafting framework
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure-mac_os_x.sh", "--install-dir", prefix
	 system "make", "all"
	 system "make", "install"
