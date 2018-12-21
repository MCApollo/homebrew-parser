name :
	 GitCal
homepage :
	 https://github.com/k4rthik/git-cal
url :
	 https://github.com/k4rthik/git-cal/archive/v0.9.1.tar.gz
description :
	 GitHub-like contributions calendar but on the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "perl", "Makefile.PL", "PREFIX=#{prefix}"
	 system "make"
	 system "make", "install"
