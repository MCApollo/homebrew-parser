name :
	 Mytop
homepage :
	 http://www.mysqlfanboy.com/mytop-3/
url :
	 http://www.mysqlfanboy.com/mytop-3/mytop-1.9.1.tar.gz
description :
	 Top-like query monitor for MySQL
build_deps :
link_deps :
	 mysql-client
	 openssl
optional_deps :
conflicts :
	 mariadb
resource :
	 ['List::Util', 'Config::IniFiles', 'DBI', 'DBD::mysql']
	 ['https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.46.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Config-IniFiles-2.94.tar.gz', 'https://cpan.metacpan.org/authors/id/T/TI/TIMB/DBI-1.641.tar.gz', 'https://cpan.metacpan.org/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.046.tar.gz']
patches :
	 https://mirrorservice.org/sites/ftp.debian.org/debian/pool/main/m/mytop/mytop_1.9.1-2.debian.tar.xz
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 end
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{prefix}"
	 system "make", "test", "install"
	 share.install prefix/"man"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
