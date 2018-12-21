name :
	 Angband
homepage :
	 https://rephial.org/
url :
	 https://rephial.org/downloads/4.1/angband-4.1.3.tar.gz
description :
	 Dungeon exploration game
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["NCURSES_CONFIG"] = "#{MacOS.sdk_path}/usr/bin/ncurses5.4-config"
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--bindir=#{bin}",
	 "--libdir=#{libexec}",
	 "--enable-curses",
	 "--disable-ncursestest",
	 "--disable-sdltest",
	 "--disable-x11",
	 "--with-ncurses-prefix=#{MacOS.sdk_path}/usr"
	 system "make"
	 system "make", "install"
	 if build.with? "cocoa"
	 cd "src" do
	 system "make", "-f", "Makefile.osx"
