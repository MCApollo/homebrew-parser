name :
	 Efl
homepage :
	 https://www.enlightenment.org
url :
	 https://download.enlightenment.org/rel/libs/efl/efl-1.21.0.tar.xz
description :
	 Enlightenment Foundation Libraries
build_deps :
	 gettext
	 pkg-config
link_deps :
	 bullet
	 dbus
	 fontconfig
	 freetype
	 fribidi
	 giflib
	 gst-plugins-good
	 gstreamer
	 jpeg
	 libpng
	 libraw
	 librsvg
	 libsndfile
	 libspectre
	 libtiff
	 luajit
	 openssl
	 poppler
	 pulseaudio
	 shared-mime-info
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
	 system Formula["shared-mime-info"].opt_bin/"update-mime-database", "#{HOMEBREW_PREFIX}/share/mime"
