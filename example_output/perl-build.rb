name :
	 PerlBuild
homepage :
	 https://github.com/tokuhirom/Perl-Build
url :
	 https://github.com/tokuhirom/Perl-Build/archive/1.25.tar.gz
description :
	 Perl builder
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 (buildpath/"perl-build").unlink
	 (buildpath/"bin/perl-build").unlink
	 build_pl = ["Module::Build::Tiny", "CPAN::Perl::Releases::MetaCPAN"]
	 resources.each do |r|
	 r.stage do
	 next if build_pl.include? r.name
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
