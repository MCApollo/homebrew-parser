name :
	 Imapsync
homepage :
	 http://ks.lamiral.info/imapsync/
url :
	 https://imapsync.lamiral.info/dist2/imapsync-1.882.tgz
description :
	 Migrate or backup IMAP mail accounts
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['Unicode::String', 'File::Copy::Recursive', 'Authen::NTLM', 'Mail::IMAPClient', 'IO::Tee', 'Data::Uniqid', 'JSON', 'Test::MockObject', 'JSON::WebToken', 'Module::Build::Tiny', 'Readonly', 'Sys::MemInfo']
	 ['https://cpan.metacpan.org/authors/id/G/GA/GAAS/GAAS/Unicode-String-2.10.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.44.tar.gz', 'https://cpan.metacpan.org/authors/id/N/NB/NBEBOUT/NTLM-1.09.tar.gz', 'https://cpan.metacpan.org/authors/id/P/PL/PLOBBES/Mail-IMAPClient-3.39.tar.gz', 'https://cpan.metacpan.org/authors/id/N/NE/NEILB/IO-Tee-0.65.tar.gz', 'https://cpan.metacpan.org/authors/id/M/MW/MWX/Data-Uniqid-0.12.tar.gz', 'https://cpan.metacpan.org/authors/id/I/IS/ISHIGAKI/JSON-2.97001.tar.gz', 'https://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/Test-MockObject-1.20161202.tar.gz', 'https://cpan.metacpan.org/authors/id/X/XA/XAICRON/JSON-WebToken-0.10.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-Tiny-0.039.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SA/SANKO/Readonly-2.05.tar.gz', 'https://cpan.metacpan.org/authors/id/S/SC/SCRESTO/Sys-MemInfo-0.99.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 build_pl = ["JSON::WebToken", "Module::Build::Tiny", "Readonly"]
	 resources.each do |r|
	 r.stage do
	 next if build_pl.include? r.name
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 build_pl.each do |name|
	 resource(name).stage do
	 system "perl", "Build.PL", "--install_base", libexec
	 system "./Build"
	 system "./Build", "install"
	 end
	 end
	 system "perl", "-c", "imapsync"
	 system "pod2man", "imapsync", "imapsync.1"
	 bin.install "imapsync"
	 man1.install "imapsync.1"
	 bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV["PERL5LIB"])
