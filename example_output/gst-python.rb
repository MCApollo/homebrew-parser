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
	 python@2
	 pygobject3
conflicts :
patches :
EOF_patch :
install :
	 if build.with?("python") && build.with?("python@2")
	 odie "You must pass both --without-python and --with-python@2 for python 2 support"