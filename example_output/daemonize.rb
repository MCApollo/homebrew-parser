name :
	 Daemonize
homepage :
	 https://software.clapper.org/daemonize/
url :
	 https://github.com/bmc/daemonize/archive/release-1.7.8.tar.gz
description :
	 Run a command as a UNIX daemon
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
