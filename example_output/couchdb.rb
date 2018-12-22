name :
	 Couchdb
homepage :
	 https://couchdb.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=/couchdb/source/1.7.1/apache-couchdb-1.7.1.tar.gz
description :
	 Document database server
build_deps :
link_deps :
	 erlang@19
	 icu4c
	 spidermonkey
conflicts :
patches :
EOF_patch :
install :
	 inreplace "etc/couchdb/default.ini.tpl.in" do |s|
	 s.gsub! "%package_author_name%", "Homebrew"
	 s.gsub! "%version%", pkg_version
	 end
	 unless build.stable?
	 touch "THANKS"
	 system "./bootstrap"
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--sysconfdir=#{etc}",
	 "--disable-init",
	 "--with-erlang=#{Formula["erlang@19"].opt_lib}/erlang/usr/include",
	 "--with-js-include=#{HOMEBREW_PREFIX}/include/js",
	 "--with-js-lib=#{HOMEBREW_PREFIX}/lib"
	 system "make"
	 system "make", "install"
	 install_geocouch if build.with? "geocouch"
	 (prefix/"Library/LaunchDaemons/org.apache.couchdb.plist").delete
	 (lib/"couchdb/bin/couchjs").chmod 0755
	 (var/"lib/couchdb").mkpath
	 (var/"log/couchdb").mkpath
	 (var/"run/couchdb").mkpath
	 if (etc/"couchdb/default.ini.default").exist?
	 mv etc/"couchdb/default.ini", etc/"couchdb/default.ini.old"
	 mv etc/"couchdb/default.ini.default", etc/"couchdb/default.ini"
	 end
