name :
	 Geeqie
homepage :
	 http://www.geeqie.org/
url :
	 https://github.com/BestImageViewer/geeqie.git
description :
	 Lightweight Gtk+ based image viewer
build_deps :
	 autoconf
	 automake
	 intltool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 atk
	 cairo
	 exiv2
	 gdk-pixbuf
	 gettext
	 glib
	 gtk+3
	 imagemagick
	 jpeg
	 libtiff
	 little-cms2
	 pango
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/patches/9cacfd49be1db430d7a956132d6521e23fc85f77/geeqie/wexitstatus_fix.diff
EOF_patch :
install :
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-glibtest",
	 "--disable-gtktest",
	 "--enable-gtk3"
	 system "make", "install"
