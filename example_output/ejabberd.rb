name :
	 Ejabberd
homepage :
	 https://www.ejabberd.im
url :
	 https://www.process-one.net/downloads/ejabberd/18.09/ejabberd-18.09.tgz
description :
	 XMPP application server
build_deps :
link_deps :
	 erlang
	 gd
	 libyaml
	 openssl
optional_deps :
	 imagemagick
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["TARGET_DIR"] = ENV["DESTDIR"] = "#{lib}/ejabberd/erlang/lib/ejabberd-#{version}"
	 ENV["MAN_DIR"] = man
	 ENV["SBIN_DIR"] = sbin
	 args = ["--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}",
	 "--enable-pgsql",
	 "--enable-mysql",
	 "--enable-odbc",
	 "--enable-pam"]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "CPP=clang -E"
	 ENV.deparallelize
	 system "make", "install"
	 (etc/"ejabberd").mkpath
	 (var/"lib/ejabberd").mkpath
	 (var/"spool/ejabberd").mkpath
