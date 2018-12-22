name :
	 Midgard2
homepage :
	 http://www.midgard-project.org/
url :
	 https://github.com/downloads/midgardproject/midgard-core/midgard2-core-12.09.tar.gz
description :
	 Generic content repository for web and desktop applications
build_deps :
	 pkg-config
link_deps :
	 dbus-glib
	 glib
	 libgda
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-libgda5
	 --with-dbus-support
	 --enable-introspection=no
	 ]
	 if build.head?
	 inreplace "autogen.sh", "libtoolize", "glibtoolize"
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
