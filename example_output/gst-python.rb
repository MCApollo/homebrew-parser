name :
	 GstPython
homepage :
	 https://gstreamer.freedesktop.org/modules/gst-python.html
url :
	 https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.14.4.tar.xz
description :
	 Python overrides for gobject-introspection-based pygst bindings
build_deps :
link_deps :
	 gst-plugins-base
	 python
	 pygobject3
	 pygobject3
optional_deps :
	 python@2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.with?("python") && build.with?("python@2")
	 odie "You must pass both --without-python and --with-python@2 for python 2 support"
	 end
	 Language::Python.each_python(build) do |python, version|
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-pygi-overrides-dir=#{lib}/python#{version}/site-packages/gi/overrides",
	 "PYTHON=#{python}"
	 system "make", "install"
	 end
