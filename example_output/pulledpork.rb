name :
	 Pulledpork
homepage :
	 https://github.com/shirkdog/pulledpork
url :
	 https://github.com/shirkdog/pulledpork/archive/v0.7.3.tar.gz
description :
	 Snort rule management
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 chmod 0755, "pulledpork.pl"
	 bin.install "pulledpork.pl"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 doc.install Dir["doc/*"]
	 (etc/"pulledpork").install Dir["etc/*"]
