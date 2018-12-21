name :
	 RakudoStar
homepage :
	 https://rakudo.org/
url :
	 https://rakudo.perl6.org/downloads/star/rakudo-star-2018.10.tar.gz
description :
	 Perl 6 compiler
build_deps :
link_deps :
	 gmp
	 icu4c
	 libffi
	 pcre
conflicts :
	 parrot
patches :
EOF_patch :
install :
	 libffi = Formula["libffi"]
	 ENV.remove "CPPFLAGS", "-I#{libffi.include}"
	 ENV.prepend "CPPFLAGS", "-I#{libffi.lib}/libffi-#{libffi.version}/include"
	 ENV.deparallelize
	 system "perl", "Configure.pl", "--prefix=#{prefix}",
	 "--backends=moar", "--gen-moar"
	 system "make"
	 ENV["NO_NETWORK_TESTING"] = "1"
	 system "make", "install"
	 bin.install_symlink Dir[share/"perl6/site/bin/*"]
	 mv "#{prefix}/man", share if File.directory?("#{prefix}/man")
