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
	 (etc/"ddclient").mkpath
	 (var/"run/ddclient").mkpath
