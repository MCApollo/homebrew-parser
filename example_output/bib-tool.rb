name :
	 BibTool
homepage :
	 http://www.gerd-neugebauer.de/software/TeX/BibTool/en/
url :
	 https://github.com/ge-ne/bibtool/releases/download/BibTool_2_67/BibTool-2.67.tar.gz
description :
	 Manipulates BibTeX databases
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--without-kpathsea"
	 system "make"
	 system "make", "install"
