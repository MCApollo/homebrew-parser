name :
	 Asciidoc
homepage :
	 http://asciidoc.org/
url :
	 https://github.com/asciidoc/asciidoc/archive/8.6.10.tar.gz
description :
	 Formatter/translator for text files to numerous formats. Includes a2x
build_deps :
	 autoconf
	 docbook-xsl
link_deps :
	 docbook
	 source-highlight
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", "/System/Library/Frameworks/Python.framework/Versions/2.7/bin"
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}"
	 inreplace %w[a2x.py asciidoc.py filters/code/code-filter.py
	 filters/graphviz/graphviz2png.py filters/latex/latex2img.py
	 filters/music/music2png.py filters/unwraplatex.py],
	 "#!/usr/bin/env python2", "#!/usr/bin/python"
	 inreplace "Makefile", "-f manpage", "-f manpage -L"
	 system "make", "install"
	 system "make", "docs"
