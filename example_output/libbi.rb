name :
	 Libbi
homepage :
	 https://libbi.org/
url :
	 https://github.com/libbi/LibBi/archive/1.4.3.tar.gz
description :
	 Bayesian state-space modelling on parallel computer hardware
build_deps :
link_deps :
	 automake
	 boost
	 gsl
	 netcdf
	 qrupdate
optional_deps :
conflicts :
resource :
	 ['Test::Simple', 'Getopt::ArgvFile', 'Carp::Assert', 'File::Slurp', 'Parse::Yapp', 'Parse::Template', 'Parse::Lex', 'Parse::RecDescent', 'Math::Symbolic', 'YAML::Tiny', 'File::Remove', 'inc::Module::Install::DSL', 'Class::Inspector', 'File::ShareDir', 'Template', 'Graph', 'thrust']
	 ['https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-1.302133.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-1.11.tar.gz', 'https://cpan.metacpan.org/authors/id/N/NE/NEILB/Carp-Assert-0.21.tar.gz', 'https://cpan.metacpan.org/authors/id/U/UR/URI/File-Slurp-9999.19.tar.gz', 'https://cpan.metacpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-1.21.tar.gz', 'https://cpan.metacpan.org/authors/id/P/PS/PSCUST/ParseTemplate-3.08.tar.gz', 'https://cpan.metacpan.org/authors/id/P/PS/PSCUST/ParseLex-2.21.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967015.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SM/SMUELLER/Math-Symbolic-0.612.tar.gz', 'https://cpan.metacpan.org/authors/id/E/ET/ETHER/YAML-Tiny-1.73.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/File-Remove-1.57.tar.gz', 'https://cpan.metacpan.org/authors/id/E/ET/ETHER/Module-Install-1.19.tar.gz', 'https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Class-Inspector-1.32.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RE/REHSACK/File-ShareDir-1.104.tar.gz', 'https://cpan.metacpan.org/authors/id/A/AB/ABW/Template-Toolkit-2.27.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JH/JHI/Graph-0.9704.tar.gz', 'https://github.com/thrust/thrust/releases/download/1.8.2/thrust-1.8.2.zip']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 next if r.name == "thrust"
	 perl_flags = "TT_ACCEPT=y" if r.name == "Template"
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", perl_flags
	 system "make"
	 system "make", "install"
	 end
	 end
	 (include/"thrust").install resource("thrust")
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLSITESCRIPT=#{bin}"
	 inreplace "script/libbi", "#!/usr/bin/env perl", "#!/usr/bin/perl"
	 system "make"
	 system "make", "install"
	 pkgshare.install "Test.bi", "test.conf"
	 bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV["PERL5LIB"])
