name :
	 Highlight
homepage :
	 http://www.andre-simon.de/doku/highlight/en/highlight.php
url :
	 http://www.andre-simon.de/zip/highlight-3.47.tar.bz2
description :
	 Convert source code to formatted text with syntax highlighting
build_deps :
	 boost
	 pkg-config
link_deps :
	 lua
conflicts :
patches :
EOF_patch :
install :
	 conf_dir = etc/"highlight/"
	 system "make", "PREFIX=#{prefix}", "conf_dir=#{conf_dir}"
	 system "make", "PREFIX=#{prefix}", "conf_dir=#{conf_dir}", "install"
