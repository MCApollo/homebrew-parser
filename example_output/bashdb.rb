name :
	 Bashdb
homepage :
	 https://bashdb.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/bashdb/bashdb/4.4-0.94/bashdb-4.4-0.94.tar.bz2
description :
	 Bash shell debugger
build_deps :
link_deps :
	 bash
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--with-bash=#{HOMEBREW_PREFIX}/bin/bash",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
