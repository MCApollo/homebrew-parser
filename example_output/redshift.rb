name :
	 Redshift
homepage :
	 http://jonls.dk/redshift/
url :
	 https://github.com/jonls/redshift/releases/download/v1.12/redshift-1.12.tar.xz
description :
	 Adjust color temperature of your screen according to your surroundings
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-corelocation
	 --disable-silent-rules
	 --disable-dependency-tracking
	 --disable-geoclue
	 --disable-geoclue2
	 --enable-quartz
	 --with-systemduserunitdir=no
	 --disable-gui
	 ]
	 system "./bootstrap" if build.head?
	 system "./configure", *args
	 system "make", "install"
	 pkgshare.install "redshift.conf.sample"
