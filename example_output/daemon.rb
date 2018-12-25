name :
	 Daemon
homepage :
	 http://libslack.org/daemon/
url :
	 http://libslack.org/daemon/download/daemon-0.6.4.tar.gz
description :
	 Turn other processes into daemons
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3323958/daemon/daemon-0.6.4-ignore-strlcpy-strlcat.patch
EOF_patch :
install :
	 ENV.deparallelize
	 system "./config"
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
