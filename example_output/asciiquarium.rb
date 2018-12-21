name :
	 Asciiquarium
homepage :
	 https://robobunny.com/projects/asciiquarium/html/
url :
	 https://robobunny.com/projects/asciiquarium/asciiquarium_1.1.tar.gz
description :
	 Aquarium animation in ASCII art
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
