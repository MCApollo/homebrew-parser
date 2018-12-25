name :
	 SqlTranslator
homepage :
	 https://github.com/dbsrgits/sql-translator/
url :
	 https://cpan.metacpan.org/authors/id/I/IL/ILMARI/SQL-Translator-0.11024.tar.gz
description :
	 Manipulate structured data definitions (SQL and more)
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
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV["PERL_MM_OPT"] = "INSTALL_BASE=#{libexec}"
	 system "perl", "Makefile.PL", "--defaultdeps"
	 system "make", "install"
	 bin.install Dir["#{libexec}/bin/sqlt*"]
	 man1.install Dir["#{libexec}/man/man1/sqlt*.1"]
	 bin.env_script_all_files libexec/"bin", :PERL5LIB => ENV["PERL5LIB"]
