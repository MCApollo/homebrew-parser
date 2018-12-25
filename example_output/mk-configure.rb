name :
	 MkConfigure
homepage :
	 https://github.com/cheusov/mk-configure
url :
	 https://downloads.sourceforge.net/project/mk-configure/mk-configure/mk-configure-0.30.0/mk-configure-0.30.0.tar.gz
description :
	 Lightweight replacement for GNU autotools
build_deps :
link_deps :
	 bmake
	 makedepend
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 ENV["MANDIR"] = man
	 system "bmake", "all"
	 system "bmake", "install"
	 doc.install "presentation/presentation.pdf"
