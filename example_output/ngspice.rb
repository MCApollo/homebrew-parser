name :
	 Ngspice
homepage :
	 https://ngspice.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ngspice/ng-spice-rework/28/ngspice-28.tar.gz
description :
	 Spice circuit simulator
build_deps :
link_deps :
	 readline
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-readline=yes
	 --enable-xspice
	 ]
	 if build.with? "x11"
	 args << "--with-x"
	 else
	 args << "--without-x"
