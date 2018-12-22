name :
	 Resty
homepage :
	 https://github.com/micha/resty
url :
	 https://github.com/micha/resty/archive/v3.0.tar.gz
description :
	 Command-line REST client that can be used in pipelines
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 pkgshare.install "resty"
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resource("JSON").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 bin.install "pp"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 bin.install "pypp"
