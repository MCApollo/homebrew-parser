name :
	 Pod2man
homepage :
	 https://www.eyrie.org/~eagle/software/podlators/
url :
	 https://archives.eyrie.org/software/perl/podlators-4.11.tar.xz
description :
	 Perl documentation generator
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
	 system "perl", "Makefile.PL", "PREFIX=#{prefix}",
	 "INSTALLSCRIPT=#{bin}",
	 "INSTALLMAN1DIR=#{man1}", "INSTALLMAN3DIR=#{man3}"
	 system "make"
	 system "make", "install"
