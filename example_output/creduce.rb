name :
	 Creduce
homepage :
	 https://embed.cs.utah.edu/creduce/
url :
	 https://embed.cs.utah.edu/creduce/creduce-2.8.0.tar.gz
description :
	 Reduce a C/C++ program while keeping a property of interest
build_deps :
link_deps :
	 astyle
	 clang-format
	 delta
	 llvm
	 :macos
optional_deps :
conflicts :
resource :
	 ['Exporter::Lite', 'File::Which', 'Getopt::Tabular', 'Regexp::Common', 'Term::ReadKey']
	 ['https://cpan.metacpan.org/authors/id/N/NE/NEILB/Exporter-Lite-0.08.tar.gz', 'https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/File-Which-1.22.tar.gz', 'https://cpan.metacpan.org/authors/id/G/GW/GWARD/Getopt-Tabular-0.3.tar.gz', 'https://cpan.metacpan.org/authors/id/A/AB/ABIGAIL/Regexp-Common-2017060201.tar.gz', 'https://cpan.metacpan.org/authors/id/J/JS/JSTOWE/TermReadKey-2.37.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV["CLANG_FORMAT"] = Formula["llvm"].opt_bin/"clang-format"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--bindir=#{libexec}"
	 system "make"
	 system "make", "install"
	 (bin/"creduce").write_env_script("#{libexec}/creduce", :PERL5LIB => ENV["PERL5LIB"])
