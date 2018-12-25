name :
	 ProxychainsNg
homepage :
	 https://sourceforge.net/projects/proxychains-ng/
url :
	 https://github.com/rofl0r/proxychains-ng/archive/v4.13.tar.gz
description :
	 Hook preloader
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
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
	 system "make"
	 system "make", "install"
	 system "make", "install-config"
