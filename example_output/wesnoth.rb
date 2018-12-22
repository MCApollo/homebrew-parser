name :
	 Wesnoth
homepage :
	 https://www.wesnoth.org/
url :
	 https://downloads.sourceforge.net/project/wesnoth/wesnoth-1.12/wesnoth-1.12.6/wesnoth-1.12.6.tar.bz2
description :
	 Single- and multi-player turn-based strategy game
build_deps :
	 gettext
	 scons
link_deps :
	 boost
	 cairo
	 fontconfig
	 fribidi
	 libpng
	 pango
	 sdl
	 sdl_image
	 sdl_mixer
	 sdl_net
	 sdl_ttf
conflicts :
patches :
EOF_patch :
install :
	 mv "scons/gettext.py", "scons/gettext_tool.py"
	 inreplace "SConstruct", ", \"gettext\",", ", \"gettext_tool\","
	 args = %W[prefix=#{prefix} docdir=#{doc} mandir=#{man} fifodir=#{var}/run/wesnothd gettextdir=#{Formula["gettext"].opt_prefix}]
	 args << "OS_ENV=true"
	 args << "install"
	 args << "wesnoth"
	 args << "wesnothd"
	 args << "-j#{ENV.make_jobs}"
	 scons *args
	 end
	 test do
	 system bin/"wesnoth", "-p", pkgshare/"data/campaigns/tutorial/", testpath
	 end
