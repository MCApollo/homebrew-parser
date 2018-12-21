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
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resource("SOAP::Lite").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
