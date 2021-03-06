name :
	 GetFlashVideos
homepage :
	 https://github.com/monsieurvideo/get-flash-videos
url :
	 https://github.com/monsieurvideo/get-flash-videos/archive/1.25.99.03.tar.gz
description :
	 Download or play videos from various Flash-based websites
build_deps :
link_deps :
	 rtmpdump
optional_deps :
conflicts :
resource :
	 ['Crypt::Blowfish_PP', 'LWP::Protocol', 'Tie::IxHash', 'WWW::Mechanize', 'Term::ProgressBar', 'Class::MethodMaker', 'Crypt::Rijndael']
	 ['https://cpan.metacpan.org/authors/id/M/MA/MATTBM/Crypt-Blowfish_PP-1.12.tar.gz', 'https://cpan.metacpan.org/authors/id/O/OA/OALDERS/libwww-perl-6.33.tar.gz', 'https://cpan.metacpan.org/authors/id/C/CH/CHORNY/Tie-IxHash-1.23.tar.gz', 'https://cpan.metacpan.org/authors/id/O/OA/OALDERS/WWW-Mechanize-1.88.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MA/MANWAR/Term-ProgressBar-2.21.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SC/SCHWIGON/class-methodmaker/Class-MethodMaker-2.24.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/Crypt-Rijndael-1.13.tar.gz']
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
	 ENV.prepend_create_path "PERL5LIB", lib/"perl5"
	 system "make"
	 (lib/"perl5").install "blib/lib/FlashVideo"
	 bin.install "bin/get_flash_videos"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 chmod 0755, libexec/"bin/get_flash_videos"
	 man1.install "blib/man1/get_flash_videos.1"
