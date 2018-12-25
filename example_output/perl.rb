name :
	 Perl
homepage :
	 https://www.perl.org/
url :
	 https://www.cpan.org/src/5.0/perl-5.28.0.tar.xz
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
	 args = %W[
	 -des
	 -Dprefix=#{prefix}
	 -Dprivlib=#{lib}/perl5/#{version}
	 -Dsitelib=#{lib}/perl5/site_perl/#{version}
	 -Dotherlibdirs=#{HOMEBREW_PREFIX}/lib/perl5/site_perl/#{version}
	 -Dperlpath=#{opt_bin}/perl
	 -Dstartperl=#!#{opt_bin}/perl
	 -Dman1dir=#{man1}
	 -Dman3dir=#{man3}
	 -Duseshrplib
	 -Duselargefiles
	 -Dusethreads
	 ]
	 args << "-Dusedtrace" if build.with? "dtrace"
	 args << "-Dusedevel" if build.head?
	 system "./Configure", *args
	 (lib/"perl5/#{version}/darwin-thread-multi-2level/CORE").install_symlink buildpath/"libperl.dylib"
	 system "make"
	 system "make", "test" if build.bottle?
	 rm lib/"perl5/#{version}/darwin-thread-multi-2level/CORE/libperl.dylib"
	 system "make", "install"
