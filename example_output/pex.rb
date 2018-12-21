name :
	 Pex
homepage :
	 https://github.com/petere/pex
url :
	 https://github.com/petere/pex/archive/1.20140409.tar.gz
description :
	 Package manager for PostgreSQL
build_deps :
link_deps :
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}", "mandir=#{man}"
