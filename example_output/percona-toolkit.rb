name :
	 PerconaToolkit
homepage :
	 https://www.percona.com/software/percona-toolkit/
url :
	 https://www.percona.com/downloads/percona-toolkit/3.0.12/source/tarball/percona-toolkit-3.0.12.tar.gz
description :
	 Percona Toolkit for MySQL
build_deps :
link_deps :
	 mysql-client
	 openssl
optional_deps :
conflicts :
resource :
	 ['DBI', 'DBD::mysql', 'JSON']
	 ['https://cpan.metacpan.org/authors/id/T/TI/TIMB/DBI-1.641.tar.gz', 'https://cpan.metacpan.org/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.046.tar.gz', 'https://cpan.metacpan.org/authors/id/I/IS/ISHIGAKI/JSON-2.97001.tar.gz']
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
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{prefix}"
	 system "make", "test", "install"
	 share.install prefix/"man"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
