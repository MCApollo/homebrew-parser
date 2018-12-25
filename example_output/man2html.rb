name :
	 Man2html
homepage :
	 https://savannah.nongnu.org/projects/man2html/
url :
	 https://www.mhonarc.org/release/misc/man2html3.0.1.tar.gz
description :
	 Convert nroff man pages to HTML
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
	 bin.mkpath
	 man1.mkpath
	 system "/usr/bin/perl", "install.me", "-batch",
	 "-binpath", bin,
	 "-manpath", man
