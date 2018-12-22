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
conflicts :
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
