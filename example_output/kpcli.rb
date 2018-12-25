name :
	 Kpcli
homepage :
	 https://kpcli.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/kpcli/kpcli-3.2.pl
description :
	 Command-line interface to KeePass database files
build_deps :
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 ['File::KeePass', 'Crypt::Rijndael', 'Sort::Naturally', 'Term::ShellUI', 'Term::Readline::Gnu', 'Data::Password', 'Clipboard', 'Mac::Pasteboard', 'Capture::Tiny']
	 ['https://cpan.metacpan.org/authors/id/R/RH/RHANDOM/File-KeePass-2.03.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LE/LEONT/Crypt-Rijndael-1.13.tar.gz', 'https://cpan.metacpan.org/authors/id/B/BI/BINGOS/Sort-Naturally-1.03.tar.gz', 'https://cpan.metacpan.org/authors/id/B/BR/BRONSON/Term-ShellUI-0.92.tar.gz', 'https://cpan.metacpan.org/authors/id/H/HA/HAYASHI/Term-ReadLine-Gnu-1.35.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RA/RAZINF/Data-Password-1.12.tar.gz', 'https://cpan.metacpan.org/authors/id/K/KI/KING/Clipboard-0.13.tar.gz', 'https://cpan.metacpan.org/authors/id/W/WY/WYANT/Mac-Pasteboard-0.009.tar.gz', 'https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-0.46.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV.prepend_path "PERL5LIB", libexec/"lib"
	 resources = [
	 "File::KeePass",
	 "Crypt::Rijndael",
	 "Sort::Naturally",
	 "Term::ShellUI",
	 "Data::Password",
	 "Clipboard",
	 "Mac::Pasteboard",
	 "Capture::Tiny",
	 ]
	 resources.each do |r|
	 resource(r).stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 end
	 resource("Term::Readline::Gnu").stage do
	 ENV.refurbish_args
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}",
	 "--includedir=#{Formula["readline"].opt_include}",
	 "--libdir=#{Formula["readline"].opt_lib}"
	 system "make", "install"
	 end
	 libexec.install "kpcli-#{version}.pl" => "kpcli"
	 chmod 0755, libexec/"kpcli"
	 (bin/"kpcli").write_env_script("#{libexec}/kpcli", :PERL5LIB => ENV["PERL5LIB"])
