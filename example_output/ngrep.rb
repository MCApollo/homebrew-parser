name :
	 Ngrep
homepage :
	 https://github.com/jpr5/ngrep
url :
	 https://github.com/jpr5/ngrep/archive/V1_47.tar.gz
description :
	 Network grep
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 sdk = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 system "./configure", "--enable-ipv6",
	 "--prefix=#{prefix}",
	 "--with-pcap-includes=#{sdk}/usr/include/pcap",
	 "--disable-pcap-restart"
	 system "make", "install"
