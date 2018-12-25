name :
	 Rcs
homepage :
	 https://www.gnu.org/software/rcs/
url :
	 https://ftp.gnu.org/gnu/rcs/rcs-5.9.4.tar.xz
description :
	 GNU revision control system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3fff7c990b8df4174045834b9c1210e7736ff5a4/rcs/noreturn.patch
	 https://raw.githubusercontent.com/macports/macports-ports/b76d1e48dac/editors/nano/files/secure_snprintf.patch
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
