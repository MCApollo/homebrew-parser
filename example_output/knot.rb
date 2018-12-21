name :
	 Knot
homepage :
	 https://www.knot-dns.cz/
url :
	 https://secure.nic.cz/files/knot-dns/knot-2.7.4.tar.xz
description :
	 High-performance authoritative-only DNS server
build_deps :
	 pkg-config
	 sphinx-doc
link_deps :
	 fstrm
	 gnutls
	 libidn
	 :macos
	 protobuf-c
	 userspace-rcu
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-configdir=#{etc}",
	 "--with-storage=#{var}/knot",
	 "--with-rundir=#{var}/run/knot",
	 "--prefix=#{prefix}",
	 "--with-module-dnstap",
	 "--enable-dnstap"
	 inreplace "samples/Makefile", "install-data-local:", "disable-install-data-local:"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 system "make", "install-singlehtml"
	 (buildpath/"knot.conf").write(knot_conf)
	 etc.install "knot.conf"
	 (var/"knot").mkpath
