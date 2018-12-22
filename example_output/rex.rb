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
	 end
	 end
	 perl_build
	 (libexec/"lib").install "blib/lib/Rex", "blib/lib/Rex.pm"
	 inreplace "bin/rexify", "#!perl", "#!/usr/bin/env perl"
	 %w[rex rexify].each do |cmd|
	 libexec.install "bin/#{cmd}"
	 chmod 0755, libexec/cmd
	 (bin/cmd).write_env_script(libexec/cmd, :PERL5LIB => ENV["PERL5LIB"])
	 man1.install "blib/man1/#{cmd}.1"
	 end
