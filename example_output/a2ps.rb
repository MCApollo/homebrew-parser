name :
	 A2ps
homepage :
	 https://www.gnu.org/software/a2ps/
url :
	 https://ftp.gnu.org/gnu/a2ps/a2ps-4.14.tar.gz
description :
	 Any-to-PostScript filter
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0ae366e6/a2ps/patch-contrib_sample_Makefile.in
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0ae366e6/a2ps/patch-lib__xstrrpl.c
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--sysconfdir=#{etc}",
	 "--with-lispdir=#{elisp}"
	 system "make", "install"
