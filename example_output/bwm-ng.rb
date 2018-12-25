name :
	 BwmNg
homepage :
	 https://www.gropp.org/?id=projects&sub=bwm-ng
url :
	 https://github.com/vgropp/bwm-ng/releases/download/v0.6.1/bwm-ng-0.6.1.tar.gz
description :
	 Console-based live network and disk I/O bandwidth monitor
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
	 ENV.append "CFLAGS", "-std=gnu89"
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
