name :
	 Dbus
homepage :
	 https://wiki.freedesktop.org/www/Software/dbus
url :
	 https://dbus.freedesktop.org/releases/dbus/dbus-1.12.12.tar.gz
description :
	 Message bus system, providing inter-application communication
build_deps :
	 xmlto
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0a8a55872e/d-bus/org.freedesktop.dbus-session.plist.osx.diff
EOF_patch :
install :
	 ENV["TMPDIR"] = "/tmp"
	 ENV["EXPAT_CFLAGS"] = "-I#{MacOS.sdk_path}/usr/include"
	 ENV["EXPAT_LIBS"] = "-lexpat"
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./autogen.sh", "--no-configure" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--sysconfdir=#{etc}",
	 "--enable-xml-docs",
	 "--disable-doxygen-docs",
	 "--enable-launchd",
	 "--with-launchd-agent-dir=#{prefix}",
	 "--without-x",
	 "--disable-tests"
	 system "make", "install"
	 system "#{bin}/dbus-uuidgen", "--ensure=#{var}/lib/dbus/machine-id"
