name :
	 Reposurgeon
homepage :
	 http://www.catb.org/esr/reposurgeon/
url :
	 https://gitlab.com/esr/reposurgeon.git
description :
	 Edit version-control repository history
build_deps :
	 asciidoc
	 xmlto
link_deps :
	 pypy
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "make", "install", "prefix=#{prefix}"
	 elisp.install "reposurgeon-mode.el"
