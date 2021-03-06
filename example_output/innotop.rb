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
optional_deps :
conflicts :
resource :
	 ['DBI', 'DBD::mysql', 'TermReadKey']
	 ['https://cpan.metacpan.org/authors/id/T/TI/TIMB/DBI-1.636.tar.gz', 'https://cpan.metacpan.org/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.046.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JS/JSTOWE/TermReadKey-2.37.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 end
	 inreplace "innotop", "#!/usr/bin/env perl", "#!/usr/bin/perl"
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{prefix}"
	 system "make", "install"
	 share.install prefix/"man"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
