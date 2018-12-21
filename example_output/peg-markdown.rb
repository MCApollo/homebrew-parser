name :
	 PegMarkdown
homepage :
	 https://github.com/jgm/peg-markdown
url :
	 https://github.com/jgm/peg-markdown/archive/0.4.14.tar.gz
description :
	 Markdown implementation based on a PEG grammar
build_deps :
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "markdown" => "peg-markdown"
