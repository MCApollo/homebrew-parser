name :
	 WirouterKeyrec
homepage :
	 https://www.salvatorefresta.net/tools/
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/wirouterkeyrec/WiRouter_KeyRec_1.1.2.zip
description :
	 Recover the default WPA passphrases from supported routers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/agpf.h", %r{/etc}, "#{prefix}/etc"
	 inreplace "src/teletu.h", %r{/etc}, "#{prefix}/etc"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{prefix}",
	 "--exec-prefix=#{prefix}"
	 system "make", "prefix=#{prefix}"
	 system "make", "install", "DESTDIR=#{prefix}", "BIN_DIR=bin/"
