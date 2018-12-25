name :
	 Amtterm
homepage :
	 https://www.kraxel.org/blog/linux/amtterm/
url :
	 https://www.kraxel.org/releases/amtterm/amtterm-1.6.tar.gz
description :
	 Serial-over-LAN (sol) client for Intel AMT
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['SOAP::Lite']
	 ['https://cpan.metacpan.org/authors/id/P/PH/PHRED/SOAP-Lite-1.11.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resource("SOAP::Lite").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 system "make", "prefix=#{prefix}", "install"
	 bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV["PERL5LIB"])
