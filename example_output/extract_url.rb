name :
	 ExtractUrl
homepage :
	 https://www.memoryhole.net/~kyle/extract_url/
url :
	 https://github.com/m3m0ryh0l3/extracturl/archive/v1.6.2.tar.gz
description :
	 Perl script to extracts URLs from emails or plain text
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['MIME::Parser', 'HTML::Parser', 'Pod::Usage', 'Env', 'Getopt::Long', 'URI::Find', 'Curses', 'Curses::UI']
	 ['https://cpan.metacpan.org/authors/id/D/DS/DSKOLL/MIME-tools-5.508.tar.gz', 'https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-3.72.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MA/MAREKR/Pod-Usage-1.69.tar.gz', 'https://cpan.metacpan.org/authors/id/F/FL/FLORA/Env-1.04.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JV/JV/Getopt-Long-2.49.1.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/URI-Find-20160806.tar.gz', 'https://cpan.metacpan.org/authors/id/G/GI/GIRAFFED/Curses-1.36.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MD/MDXI/Curses-UI-0.9609.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV.prepend_path "PERL5LIB", libexec/"lib"
	 inreplace "extract_url.pl", "#!/usr/bin/env perl", "#!/usr/bin/perl"
	 %w[MIME::Parser HTML::Parser Pod::Usage Env Getopt::Long Curses Curses::UI].each do |r|
	 resource(r).stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 resource("URI::Find").stage do
	 system "perl", "Build.PL", "--install_base", libexec
	 system "./Build"
	 system "./Build", "install"
	 end
	 system "make", "prefix=#{prefix}"
	 system "make", "prefix=#{prefix}", "install"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
