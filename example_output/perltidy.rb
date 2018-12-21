name :
	 Perltidy
homepage :
	 https://perltidy.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/perltidy/20180220/Perl-Tidy-20180220.tar.gz
description :
	 Indents and reformats Perl scripts to make them easier to read
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}",
	 "INSTALLSITESCRIPT=#{bin}",
	 "INSTALLSITEMAN1DIR=#{man1}",
	 "INSTALLSITEMAN3DIR=#{man3}"
	 system "make"
	 system "make", "test"
	 system "make", "install"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
