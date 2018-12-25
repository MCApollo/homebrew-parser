name :
	 Httptunnel
homepage :
	 https://github.com/larsbrinkhoff/httptunnel
url :
	 https://ftp.gnu.org/gnu/httptunnel/httptunnel-3.3.tar.gz
description :
	 Tunnels a data stream in HTTP requests
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
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
