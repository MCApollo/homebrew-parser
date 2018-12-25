name :
	 Moreutils
homepage :
	 https://joeyh.name/code/moreutils/
url :
	 https://git.joeyh.name/git/moreutils.git
description :
	 Collection of tools that nobody wrote when UNIX was young
build_deps :
	 docbook-xsl
link_deps :
optional_deps :
conflicts :
	 parallel
	 parallel
	 pwntools
	 errno
	 task-spooler
	 ts
resource :
	 ['Time::Duration', 'IPC::Run']
	 ['https://cpan.metacpan.org/authors/id/N/NE/NEILB/Time-Duration-1.20.tar.gz', 'https://cpan.metacpan.org/authors/id/T/TO/TODDR/IPC-Run-0.94.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resource("Time::Duration").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "--skipdeps"
	 system "make", "install"
	 end
	 resource("IPC::Run").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 inreplace "Makefile" do |s|
	 s.gsub! "/usr/share/xml/docbook/stylesheet/docbook-xsl",
	 "#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl"
	 %w[parallel errno ts].each do |util|
	 next if build.with? util
	 s.gsub! /^BINS=.*\K#{util}/, "", false
	 s.gsub! /^MANS=.*\K#{util}\.1/, ""
	 s.gsub! /^PERLSCRIPTS=.*\K#{util}/, "", false
	 end
	 end
	 system "make", "all"
	 system "make", "check"
	 system "make", "install", "PREFIX=#{prefix}"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
