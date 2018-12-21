name :
	 Rpm
homepage :
	 http://www.rpm.org/
url :
	 http://ftp.rpm.org/releases/rpm-4.14.x/rpm-4.14.1.tar.bz2
description :
	 Standard unix software packaging tool
build_deps :
link_deps :
	 berkeley-db
	 gettext
	 libarchive
	 libmagic
	 lua@5.1
	 openssl
	 pkg-config
	 popt
	 xz
	 zstd
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["lua@5.1"].opt_libexec/"lib/pkgconfig"
	 inreplace ["macros.in", "platform.in"], "@prefix@", HOMEBREW_PREFIX
	 inreplace "scripts/pkgconfigdeps.sh",
	 "/usr/bin/pkg-config", Formula["pkg-config"].opt_bin/"pkg-config"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--sharedstatedir=#{var}/lib",
	 "--sysconfdir=#{etc}",
	 "--with-path-magic=#{HOMEBREW_PREFIX}/share/misc/magic",
	 "--enable-nls",
	 "--disable-plugins",
	 "--with-external-db",
	 "--with-crypto=openssl",
	 "--without-apidocs",
	 "--with-vendor=homebrew"
	 system "make", "install"
	 (var/"lib/rpm").mkpath
	 inreplace lib/"rpm/macros", "/usr/bin/gpg2", HOMEBREW_PREFIX/"bin/gpg"
