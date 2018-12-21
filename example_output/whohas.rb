name :
	 Whohas
homepage :
	 http://www.philippwesche.org/200811/whohas/intro.html
url :
	 https://github.com/whohas/whohas/releases/download/0.29.1/whohas-0.29.1.tar.gz
description :
	 Query multiple distributions' package archives
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
	 system "make", "install"
