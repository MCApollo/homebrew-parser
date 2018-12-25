name :
	 Recutils
homepage :
	 https://www.gnu.org/software/recutils/
url :
	 https://ftp.gnu.org/gnu/recutils/recutils-1.7.tar.gz
description :
	 Tools to work with human-editable, plain text data files
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
	 "--prefix=#{prefix}",
	 "--datarootdir=#{elisp}"
	 system "make", "install"
