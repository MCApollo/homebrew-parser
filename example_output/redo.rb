name :
	 Redo
homepage :
	 https://github.com/apenwarr/redo
url :
	 https://github.com/apenwarr/redo/archive/redo-0.21.tar.gz
description :
	 Implements djb's redo: an alternative to make(1)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['docs']
	 ['man']
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 system "./redo", "install"
	 rm share/"doc/redo/README.md"
	 man1.install resource("docs")
