name :
	 Rinetd
homepage :
	 https://www.boutell.com/rinetd/
url :
	 https://www.boutell.com/rinetd/http/rinetd.tar.gz
description :
	 Internet TCP redirection server
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "rinetd.c" do |s|
	 s.gsub! "/etc/rinetd.conf", "#{etc}/rinetd.conf"
	 s.gsub! "/var/run/rinetd.pid", "#{var}/rinetd.pid"
