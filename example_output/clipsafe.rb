name :
	 Clipsafe
homepage :
	 http://waxandwane.org/clipsafe.html
url :
	 http://waxandwane.org/download/clipsafe-1.1.tar.gz
description :
	 Command-line interface to Password Safe
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 ['Crypt::Twofish', 'Digest::SHA', 'DateTime', 'DateTime::Locale', 'DateTime::TimeZone']
	 ['https://cpan.metacpan.org/authors/id/A/AM/AMS/Crypt-Twofish-2.17.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MS/MSHELOR/Digest-SHA-5.96.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-1.35.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-Locale-1.05.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-TimeZone-2.01.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resource("Crypt::Twofish").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 resource("Digest::SHA").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 resource("DateTime").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 resource("DateTime::Locale").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 resource("DateTime::TimeZone").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 bin.install "clipsafe"
	 bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV["PERL5LIB"])
