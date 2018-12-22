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
