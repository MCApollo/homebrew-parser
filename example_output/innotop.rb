name :
	 Innotop
homepage :
	 https://github.com/innotop/innotop/
url :
	 https://github.com/innotop/innotop/archive/v1.12.0.tar.gz
description :
	 Top clone for MySQL
build_deps :
link_deps :
	 mysql-client
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
