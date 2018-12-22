name :
	 Dnsrend
homepage :
	 http://romana.now.ie/dnsrend
url :
	 http://romana.now.ie/software/dnsrend-0.08.tar.gz
description :
	 DNS message dissector
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 libexec.install "dnsrend"
	 doc.install "README"
	 (bin/"dnsrend").write <<~EOS
	 #!/bin/sh
	 /usr/bin/env perl -Tw -I "#{libexec}/lib/perl5" #{libexec}/dnsrend "$@"
	 EOS
