name :
	 Sslmate
homepage :
	 https://sslmate.com
url :
	 https://packages.sslmate.com/other/sslmate-1.7.0.tar.gz
description :
	 Buy SSL certs from the command-line
build_deps :
link_deps :
	 python
	 perl
	 curl
optional_deps :
conflicts :
resource :
	 ['URI', 'Term::ReadKey', 'JSON::PP', 'boto']
	 ['https://cpan.metacpan.org/authors/id/E/ET/ETHER/URI-1.67.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JS/JSTOWE/TermReadKey-2.32.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MA/MAKAMAKA/JSON-PP-2.27300.tar.gz', 'https://files.pythonhosted.org/packages/c8/af/54a920ff4255664f5d238b5aebd8eedf7a07c7a5e71e27afcfe840b82f51/boto-2.49.0.tar.gz']
patches :
EOF_patch :
install :
	 if MacOS.version <= :snow_leopard
	 ENV.prepend_path "PATH", Formula["perl"].bin
	 end
	 ENV.prepend_create_path "PERL5LIB", libexec/"vendor/lib/perl5"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 perl_resources = []
	 perl_resources << "URI" << "Term::ReadKey" if MacOS.version <= :snow_leopard
	 perl_resources << "JSON::PP" if MacOS.version <= :mountain_lion
	 perl_resources.each do |r|
	 resource(r).stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}/vendor"
	 system "make"
	 system "make", "install"
	 end
	 end
	 resource("boto").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
	 env = { :PERL5LIB => ENV["PERL5LIB"] }
	 if MacOS.version <= :snow_leopard
	 env[:PATH] = "#{Formula["perl"].bin}:#{Formula["curl"].bin}:$PATH"
	 end
	 env[:PYTHONPATH] = ENV["PYTHONPATH"]
	 bin.env_script_all_files(libexec/"bin", env)
	 unless MacOS.version <= :snow_leopard
	 inreplace libexec/"bin/sslmate",
	 "#!/usr/bin/env perl", "#!/usr/bin/perl"
	 end
