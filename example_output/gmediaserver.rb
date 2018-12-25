name :
	 Gmediaserver
homepage :
	 https://www.gnu.org/software/gmediaserver/
url :
	 https://download.savannah.gnu.org/releases/gmediaserver/gmediaserver-0.13.0.tar.gz
description :
	 UPnP Mediaserver
build_deps :
	 pkg-config
link_deps :
	 libmagic
	 libupnp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c68985023c/gmediaserver/sigwait.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/893042fbfb/gmediaserver/libupnp_1.6.19_support.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
