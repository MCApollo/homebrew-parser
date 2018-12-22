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
conflicts :
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
