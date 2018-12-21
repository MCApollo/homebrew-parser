name :
	 Reminiscence
homepage :
	 http://cyxdown.free.fr/reminiscence/
url :
	 http://cyxdown.free.fr/reminiscence/REminiscence-0.3.7.tar.bz2
description :
	 Flashback engine reimplementation
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libmodplug
	 libogg
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 resource("tremor").stage do
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}",
	 "--disable-static"
	 system "make", "install"
