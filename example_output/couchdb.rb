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
	 (var/"lib/couchdb").mkpath
	 (var/"log/couchdb").mkpath
	 (var/"run/couchdb").mkpath
	 if (etc/"couchdb/default.ini.default").exist?
	 mv etc/"couchdb/default.ini", etc/"couchdb/default.ini.old"
	 mv etc/"couchdb/default.ini.default", etc/"couchdb/default.ini"
