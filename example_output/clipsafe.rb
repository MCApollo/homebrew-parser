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
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resource("Crypt::Twofish").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
