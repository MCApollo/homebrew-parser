name :
	 Vit
homepage :
	 https://taskwarrior.org/news/news.20140406.html
url :
	 https://taskwarrior.org/download/vit-1.2.tar.gz
description :
	 Front-end for Task Warrior
build_deps :
link_deps :
	 task
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resource("Curses").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "build"
	 bin.install "vit"
	 man1.install "vit.1"
	 man5.install "vitrc.5"
	 (prefix+"etc").install "commands" => "vit-commands"
	 bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV["PERL5LIB"])
