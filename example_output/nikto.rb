name :
	 Nikto
homepage :
	 https://cirt.net/nikto2
url :
	 https://github.com/sullo/nikto/archive/2.1.6.tar.gz
description :
	 Web server scanner
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "program" do
	 inreplace "nikto.pl", "/etc/nikto.conf", "#{etc}/nikto.conf"
	 inreplace "nikto.conf" do |s|
	 s.gsub! "
	 s.gsub! "
	 "PLUGINDIR=#{pkgshare}/plugins"
	 s.gsub! "
	 "DBDIR=#{var}/lib/nikto/databases"
	 s.gsub! "
	 "TEMPLATEDIR=#{pkgshare}/templates"
	 s.gsub! "
	 end
	 bin.install "nikto.pl" => "nikto"
	 bin.install "replay.pl"
	 etc.install "nikto.conf"
	 man1.install "docs/nikto.1"
	 pkgshare.install "docs", "plugins", "templates"
	 end
	 doc.install Dir["documentation/*"]
	 (var/"lib/nikto/databases").mkpath
	 cp_r Dir["program/databases/*"], var/"lib/nikto/databases"
