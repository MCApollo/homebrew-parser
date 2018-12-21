name :
	 Gtkx3
homepage :
	 https://gtk.org/
url :
	 https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.2.tar.xz
description :
	 Toolkit for creating graphical user interfaces
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 atk
	 gdk-pixbuf
	 glib
	 hicolor-icon-theme
	 libepoxy
	 pango
	 gsettings-desktop-schemas
conflicts :
patches :
	 https://gitlab.gnome.org/jralls/gtk/commit/efb3888af770937c6c2c184d9beea19fbc24bb4a.patch
EOF_patch :
	 diff --git a/gdk/quartz/gdkevents-quartz.c b/gdk/quartz/gdkevents-quartz.c
	 index 952d4a8189..642fe7f1ee 100644
	 --- a/gdk/quartz/gdkevents-quartz.c
	 +++ b/gdk/quartz/gdkevents-quartz.c
	 @@ -1551,8 +1551,10 @@ gdk_event_translate (GdkEvent *event,
	 grab = _gdk_display_get_last_device_grab (_gdk_display,
	 gdk_seat_get_pointer (seat));
	 }
	 -      return_val = TRUE;
	 }
	 +
	 +  return_val = TRUE;
	 +
	 switch (event_type)
	 {
	 case GDK_QUARTZ_LEFT_MOUSE_DOWN:
install :
	 args = %W[
	 --enable-debug=minimal
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-glibtest
	 --enable-introspection=yes
	 --disable-schemas-compile
	 --enable-quartz-backend
	 --disable-x11-backend
	 ]
	 system "./configure", *args
	 bin.mkpath
	 ENV.prepend_path "PATH", bin
	 system "make", "install"
	 mv bin/"gtk-update-icon-cache", bin/"gtk3-update-icon-cache"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
