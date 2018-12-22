name :
	 Webdis
homepage :
	 https://webd.is/
url :
	 https://github.com/nicolasff/webdis/archive/0.1.4.tar.gz
description :
	 Redis HTTP interface with JSON output
build_deps :
link_deps :
	 libevent
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "webdis"
	 inreplace "webdis.prod.json" do |s|
	 s.gsub! "/var/log/webdis.log", "#{var}/log/webdis.log"
	 s.gsub! /daemonize":\s*true/, "daemonize\":\tfalse"
	 end
	 etc.install "webdis.json", "webdis.prod.json"
	 (var/"log").mkpath
