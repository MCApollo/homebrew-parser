name :
	 MysqlSandbox
homepage :
	 https://mysqlsandbox.net
url :
	 https://github.com/datacharmer/mysql-sandbox/archive/3.2.17.tar.gz
description :
	 Install one or more MySQL servers
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PERL_LIBDIR"] = libexec/"lib/perl5"
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5/site_perl"
	 system "perl", "Makefile.PL", "PREFIX=#{libexec}"
	 system "make", "test", "install"
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
