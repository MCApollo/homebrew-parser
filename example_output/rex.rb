name :
	 Rex
homepage :
	 https://www.rexify.org
url :
	 https://cpan.metacpan.org/authors/id/J/JF/JFRIED/Rex-1.5.0.tar.gz
description :
	 Command-line tool which executes commands on remote servers
build_deps :
link_deps :
	 perl
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV.prepend_path "PERL5LIB", libexec/"lib"
	 ENV["PERL_CANARY_STABILITY_NOPROMPT"] = "1"
	 resources.each do |res|
	 res.stage do
	 perl_build
