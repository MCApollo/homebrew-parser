name :
	 St
homepage :
	 https://github.com/nferraz/st
url :
	 https://github.com/nferraz/st/archive/v1.1.4.tar.gz
description :
	 Statistics from the command-line
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
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5/site_perl/"
	 system "perl", "Makefile.PL", "PREFIX=#{libexec}"
	 system "make", "install"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files libexec/"bin", :PERL5LIB => ENV["PERL5LIB"]
	 man1.install_symlink Dir[libexec/"share/man/man1/*.1"]
