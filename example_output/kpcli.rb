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
