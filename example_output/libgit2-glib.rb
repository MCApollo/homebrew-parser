name :
	 Libgit2Glib
homepage :
	 https://github.com/GNOME/libgit2-glib
url :
	 https://download.gnome.org/sources/libgit2-glib/0.27/libgit2-glib-0.27.7.tar.xz
description :
	 Glib wrapper library around libgit2 git access library
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
	 vala
link_deps :
	 gettext
	 glib
	 libgit2
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 inreplace "libgit2-glib/meson.build",
	 "libgit2_glib_link_args = [ '-Wl,-Bsymbolic-functions' ]",
	 "libgit2_glib_link_args = []"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}",
	 "-Dpython=false",
	 "-Dvapi=true",
	 ".."
	 system "ninja"
	 system "ninja", "install"
	 libexec.install Dir["examples/*"]
