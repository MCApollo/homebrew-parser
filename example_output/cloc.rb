name :
	 Cloc
homepage :
	 https://github.com/AlDanial/cloc/
url :
	 https://github.com/AlDanial/cloc/releases/download/v1.80/cloc-1.80.tar.gz
description :
	 Statistics utility to count lines of code
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['Regexp::Common', 'Algorithm::Diff', 'Parallel::ForkManager']
	 ['https://cpan.metacpan.org/authors/id/A/AB/ABIGAIL/Regexp-Common-2017060201.tar.gz', 'https://cpan.metacpan.org/authors/id/T/TY/TYEMQ/Algorithm-Diff-1.1903.tar.gz', 'https://cpan.metacpan.org/authors/id/Y/YA/YANICK/Parallel-ForkManager-1.20.tar.gz']
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
	 system "make", "-C", "Unix", "prefix=#{libexec}", "install"
	 bin.install libexec/"bin/cloc"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 man1.install libexec/"share/man/man1/cloc.1"
