name :
	 Vimpc
homepage :
	 https://sourceforge.net/projects/vimpc/
url :
	 https://downloads.sourceforge.net/project/vimpc/Release%200.09.1/vimpc-0.09.1.tar.gz
description :
	 Ncurses based mpd client with vi like key bindings
build_deps :
	 pkg-config
link_deps :
	 boost
	 libmpdclient
	 pcre
	 taglib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
