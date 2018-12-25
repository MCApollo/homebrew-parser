name :
	 Nedit
homepage :
	 https://sourceforge.net/projects/nedit/
url :
	 https://downloads.sourceforge.net/project/nedit/nedit-source/nedit-5.7-src.tar.gz
description :
	 Fast, compact Motif/X11 plain text editor
build_deps :
link_deps :
	 openmotif
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "macosx", "MOTIFLINK='-lXm'"
	 system "make", "-C", "doc", "man", "doc"
	 bin.install "source/nedit"
	 bin.install "source/nc" => "ncl"
	 man1.install "doc/nedit.man" => "nedit.1x"
	 man1.install "doc/nc.man" => "ncl.1x"
	 (etc/"X11/app-defaults").install "doc/NEdit.ad" => "NEdit"
	 doc.install Dir["doc/*"]
