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
conflicts :
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
