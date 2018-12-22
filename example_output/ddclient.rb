name :
	 Ddclient
homepage :
	 https://sourceforge.net/p/ddclient/wiki/Home
url :
	 https://downloads.sourceforge.net/project/ddclient/ddclient/ddclient-3.9.0/ddclient-3.9.0.tar.gz
description :
	 Update dynamic DNS entries
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 inreplace "ddclient" do |s|
	 s.gsub! "/etc/ddclient", "#{etc}/ddclient"
	 s.gsub! "/var/cache/ddclient", "#{var}/run/ddclient"
	 end
	 sbin.install "ddclient"
	 sbin.env_script_all_files(libexec/"sbin", :PERL5LIB => ENV["PERL5LIB"])
	 inreplace "sample-ddclient-wrapper.sh",
	 "/etc/ddclient", "#{etc}/ddclient"
	 inreplace "sample-etc_cron.d_ddclient",
	 "/usr/sbin/ddclient", "#{sbin}/ddclient"
	 inreplace "sample-etc_ddclient.conf",
	 "/var/run/ddclient.pid", "#{var}/run/ddclient/pid"
	 doc.install %w[
	 sample-ddclient-wrapper.sh
	 sample-etc_cron.d_ddclient
	 sample-etc_ddclient.conf
	 ]
	 (etc/"ddclient").mkpath
	 (var/"run/ddclient").mkpath
