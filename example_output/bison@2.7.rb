name :
	 BisonAT27
homepage :
	 https://www.gnu.org/software/bison/
url :
	 https://ftp.gnu.org/gnu/bison/bison-2.7.1.tar.gz
description :
	 Parser generator
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/macports/macports-ports/b76d1e48dac/editors/nano/files/secure_snprintf.patch
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
