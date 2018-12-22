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
