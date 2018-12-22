name :
	 SharedMimeInfo
homepage :
	 https://wiki.freedesktop.org/www/Software/shared-mime-info
url :
	 https://freedesktop.org/~hadess/shared-mime-info-1.10.tar.xz
description :
	 Database of common MIME types
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-update-mimedb
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
	 pkgshare.install share/"mime/packages"
	 rmdir share/"mime"
	 ln_sf HOMEBREW_PREFIX/"share/mime", share/"mime"
	 (HOMEBREW_PREFIX/"share/mime/packages").mkpath
	 cp (pkgshare/"packages").children, HOMEBREW_PREFIX/"share/mime/packages"
	 system bin/"update-mime-database", HOMEBREW_PREFIX/"share/mime"
