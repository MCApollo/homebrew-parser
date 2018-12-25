name :
	 GnuTypist
homepage :
	 https://www.gnu.org/software/gtypist/
url :
	 https://ftp.gnu.org/gnu/gtypist/gtypist-2.9.5.tar.xz
description :
	 GNU typing tutor
build_deps :
link_deps :
	 gettext
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/42c4b96/gnu-typist/2.9.5.patch
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-lispdir=#{elisp}"
	 system "make"
	 system "make", "install"
