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
optional_deps :
conflicts :
resource :
	 ['inc::latest', 'Module::Build', 'Module::Build::Tiny', 'ExtUtils::Config', 'ExtUtils::Helpers', 'ExtUtils::InstallPaths', 'HTTP::Tinyish', 'common::sense', 'Perl::Strip', 'App::FatPacker', 'CPAN::Perl::Releases', 'CPAN::Perl::Releases::MetaCPAN', 'File::pushd', 'HTTP::Tiny', 'IO::File', 'MIME::Base64', 'XSLoader', 'Module::Pluggable', 'Exporter', 'Carp', 'ExtUtils::MakeMaker', 'Data::Dumper', 'Encode', 'parent', 'PathTools', 'Scalar-List-Utils', 'if', 'Devel::PatchPerl', 'File::Temp', 'Getopt::Long', 'Pod::Text', 'Pod::Usage']
	 ['https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/inc-latest-0.500.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-0.4222.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-Tiny-0.039.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-Config-0.008.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-Helpers-0.026.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-0.012.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/HTTP-Tinyish-0.14.tar.gz', 'https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/common-sense-3.74.tar.gz', 'https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/Perl-Strip-1.1.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MS/MSTROUT/App-FatPacker-0.010007.tar.gz', 'https://cpan.metacpan.org/authors/id/B/BI/BINGOS/CPAN-Perl-Releases-3.72.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SK/SKAJI/CPAN-Perl-Releases-MetaCPAN-0.006.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/File-pushd-1.014.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/HTTP-Tiny-0.070.tar.gz', 'https://cpan.metacpan.org/authors/id/G/GB/GBARR/IO-1.25.tar.gz', 'https://cpan.metacpan.org/authors/id/G/GA/GAAS/MIME-Base64-3.15.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SA/SAPER/XSLoader-0.24.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SI/SIMONW/Module-Pluggable-5.2.tar.gz', 'https://cpan.metacpan.org/authors/id/T/TO/TODDR/Exporter-5.72.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Carp-1.38.tar.gz', 'https://cpan.metacpan.org/authors/id/B/BI/BINGOS/ExtUtils-MakeMaker-7.24.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SM/SMUELLER/Data-Dumper-2.161.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DA/DANKOGAI/Encode-2.89.tar.gz', 'https://cpan.metacpan.org/authors/id/C/CO/CORION/parent-0.236.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RJ/RJBS/PathTools-3.62.tar.gz', 'https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.47.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RJ/RJBS/if-0.0606.tar.gz', 'https://cpan.metacpan.org/authors/id/B/BI/BINGOS/Devel-PatchPerl-1.48.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/File-Temp-0.2304.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JV/JV/Getopt-Long-2.49.1.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RR/RRA/podlators-4.09.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MA/MAREKR/Pod-Usage-1.69.tar.gz']
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
	 end
	 end
	 build_pl.each do |name|
	 resource(name).stage do
	 system "perl", "Build.PL", "--install_base", libexec
	 system "./Build"
	 system "./Build", "install"
	 end
	 end
	 ENV.prepend_path "PATH", libexec/"bin"
	 system "perl", "Build.PL", "--install_base", libexec
	 (buildpath/"bin").install_symlink buildpath/"script/perl-build"
	 system "./Build"
	 system "./Build", "install"
	 %w[perl-build plenv-install plenv-uninstall].each do |cmd|
	 (bin/cmd).write_env_script(libexec/"bin/#{cmd}", :PERL5LIB => ENV["PERL5LIB"])
	 end
