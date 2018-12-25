name :
	 GlibOpenssl
homepage :
	 https://launchpad.net/glib-networking
url :
	 https://download.gnome.org/sources/glib-openssl/2.50/glib-openssl-2.50.8.tar.xz
description :
	 OpenSSL GIO module for glib
build_deps :
	 pkg-config
link_deps :
	 glib
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure", "$($PKG_CONFIG --variable giomoduledir gio-2.0)", lib/"gio/modules"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-static",
	 "--prefix=#{prefix}",
	 "--with-ca-certificates=#{etc}/openssl/cert.pem"
	 system "make", "install"
	 rm lib/"gio/modules/giomodule.cache"
	 system Formula["glib"].opt_bin/"gio-querymodules", HOMEBREW_PREFIX/"lib/gio/modules"
