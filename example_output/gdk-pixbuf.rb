name :
	 GdkPixbuf
homepage :
	 https://gtk.org
url :
	 https://download.gnome.org/sources/gdk-pixbuf/2.38/gdk-pixbuf-2.38.0.tar.xz
description :
	 Toolkit for image loading and pixel buffer manipulation
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 glib
	 jpeg
	 libpng
	 libtiff
optional_deps :
	 jasper
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3d39ffd/gdk-pixbuf/meson-patches.diff
EOF_patch :
install :
	 inreplace "gdk-pixbuf/meson.build",
	 "-DGDK_PIXBUF_LIBDIR=\"@0@\"'.format(gdk_pixbuf_libdir)",
	 "-DGDK_PIXBUF_LIBDIR=\"@0@\"'.format('#{HOMEBREW_PREFIX}/lib')"
	 args = %W[
	 --prefix=#{prefix}
	 -Dx11=false
	 -Ddocs=false
	 -Dgir=true
	 -Drelocatable=false
	 -Dnative_windows_loaders=false
	 -Dinstalled_tests=false
	 -Dman=false
	 ]
	 args << "-Djasper=true" if build.with?("jasper")
	 ENV["DESTDIR"] = "/"
	 mkdir "build" do
	 system "meson", *args, ".."
	 system "ninja", "-v"
	 system "ninja", "install"
	 end
	 inreplace lib/"pkgconfig/gdk-pixbuf-#{gdk_so_ver}.pc" do |s|
	 libv = s.get_make_var "gdk_pixbuf_binary_version"
	 s.change_make_var! "gdk_pixbuf_binarydir",
	 HOMEBREW_PREFIX/"lib/gdk-pixbuf-#{gdk_so_ver}"/libv
	 end
	 ENV["GDK_PIXBUF_MODULEDIR"] = "#{module_dir}/loaders"
	 system "#{bin}/gdk-pixbuf-query-loaders", "--update-cache"
