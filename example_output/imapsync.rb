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
conflicts :
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
