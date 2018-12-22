name :
	 Cloc
homepage :
	 https://github.com/AlDanial/cloc/
url :
	 https://github.com/AlDanial/cloc/releases/download/v1.80/cloc-1.80.tar.gz
description :
	 Statistics utility to count lines of code
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 end
	 system "make", "-C", "Unix", "prefix=#{libexec}", "install"
	 bin.install libexec/"bin/cloc"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 man1.install libexec/"share/man/man1/cloc.1"
