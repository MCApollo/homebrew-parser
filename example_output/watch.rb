name :
	 Watch
homepage :
	 https://gitlab.com/procps-ng/procps
url :
	 https://gitlab.com/procps-ng/procps.git
description :
	 Executes a program periodically, showing output fullscreen
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 gettext
optional_deps :
conflicts :
	 visionmedia-watch
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-nls"
	 system "make", "watch"
	 bin.install "watch"
	 man1.install "watch.1"
