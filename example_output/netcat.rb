name :
	 Netcat
homepage :
	 https://netcat.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/netcat/netcat/0.7.1/netcat-0.7.1.tar.bz2
description :
	 Utility for managing network connections
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}"
	 system "make", "install"
	 man1.install_symlink "netcat.1" => "nc.1"
