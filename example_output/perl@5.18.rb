name :
	 PerlAT518
homepage :
	 https://www.perl.org/
url :
	 https://www.cpan.org/src/5.0/perl-5.18.4.tar.gz
description :
	 Highly capable, feature-rich programming language
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
	 args = [
	 "-des",
	 "-Dprefix=#{prefix}",
	 "-Dman1dir=#{man1}",
	 "-Dman3dir=#{man3}",
	 "-Duseshrplib",
	 "-Duselargefiles",
	 "-Dusethreads",
	 ]
	 args << "-Dusedtrace" if build.with? "dtrace"
	 system "./Configure", *args
	 system "make"
	 system "make", "test" if build.with? "tests"
	 system "make", "install"
