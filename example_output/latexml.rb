name :
	 Latexml
homepage :
	 https://dlmf.nist.gov/LaTeXML/
url :
	 https://dlmf.nist.gov/LaTeXML/releases/LaTeXML-0.8.2.tar.gz
description :
	 LaTeX to XML/HTML/MathML Converter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
