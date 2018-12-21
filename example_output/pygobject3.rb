name :
	 Pygobject3
homepage :
	 https://wiki.gnome.org/Projects/PyGObject
url :
	 https://download.gnome.org/sources/pygobject/3.30/pygobject-3.30.4.tar.xz
description :
	 GNOME Python bindings (based on GObject Introspection)
build_deps :
	 meson
	 ninja
	 pkg-config
link_deps :
	 python
	 gobject-introspection
	 py3cairo
	 python@2
	 py2cairo
conflicts :
patches :
EOF_patch :
install :
	 Language::Python.each_python(build) do |python, version|
	 mkdir "build#{version}" do
	 system "meson", "--prefix=#{prefix}",
	 "-Dpycairo=true",
	 "-Dpython=#{python}",
	 ".."
	 system "ninja", "-v"
	 system "ninja", "install"
