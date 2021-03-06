name :
	 Whohas
homepage :
	 http://www.philippwesche.org/200811/whohas/intro.html
url :
	 https://github.com/whohas/whohas/releases/download/0.29.1/whohas-0.29.1.tar.gz
description :
	 Query multiple distributions' package archives
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['Acme::Damn', 'forks', 'Sys::SigAction']
	 ['https://cpan.metacpan.org/authors/id/I/IB/IBB/Acme-Damn-0.08.tar.gz', 'https://cpan.metacpan.org/authors/id/R/RY/RYBSKEJ/forks-0.36.tar.gz', 'https://cpan.metacpan.org/authors/id/L/LB/LBAXTER/Sys-SigAction-0.23.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 end
	 bin.install "whohas"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 man1.install "usr/share/man/man1/whohas.1"
	 doc.install "html_assets", "intro.html"
