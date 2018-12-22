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
	 end
	 inreplace "Makefile" do |s|
	 s.gsub! "/usr/sbin", sbin
	 s.gsub! "/usr/man", man
	 end
	 sbin.mkpath
	 man8.mkpath
	 system "make", "install"
	 conf = etc/"rinetd.conf"
	 unless conf.exist?
	 conf.write <<~EOS
	 #
	 #
	 EOS
