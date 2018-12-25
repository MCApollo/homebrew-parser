name :
	 LincityNg
homepage :
	 https://github.com/lincity-ng/lincity-ng/
url :
	 https://github.com/lincity-ng/lincity-ng/archive/lincity-ng-2.0.tar.gz
description :
	 City simulation game
build_deps :
	 autoconf
	 automake
	 jam
	 pkg-config
link_deps :
	 physfs
	 sdl
	 sdl_gfx
	 sdl_image
	 sdl_mixer
	 sdl_ttf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system 'cat data/gui/creditslist.xml | grep -v "@" | cut -d\> -f2 | cut -d\< -f1 >CREDITS'
	 system "./autogen.sh"
	 system "./configure", "--disable-sdltest",
	 "--with-apple-opengl-framework",
	 "--prefix=#{prefix}",
	 "--datarootdir=#{pkgshare}"
	 system "jam", "install"
	 rm_rf ["#{pkgshare}/applications", "#{pkgshare}/pixmaps"]
