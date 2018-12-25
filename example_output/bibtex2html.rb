name :
	 Bibtex2html
homepage :
	 https://www.lri.fr/~filliatr/bibtex2html/
url :
	 https://www.lri.fr/~filliatr/ftp/bibtex2html/bibtex2html-1.99.tar.gz
description :
	 BibTeX to HTML converter
build_deps :
link_deps :
	 hevea
	 ocaml
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 inreplace "Makefile.in" do |s|
	 s.remove_make_var! "STRLIB"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
