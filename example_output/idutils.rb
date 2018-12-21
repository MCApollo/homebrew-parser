name :
	 Idutils
homepage :
	 https://www.gnu.org/s/idutils/
url :
	 https://ftp.gnu.org/gnu/idutils/idutils-4.6.tar.xz
description :
	 ID database and query tools
build_deps :
link_deps :
conflicts :
	 coreutils
patches :
	 https://raw.githubusercontent.com/macports/macports-ports/b76d1e48dac/editors/nano/files/secure_snprintf.patch
EOF_patch :
install :
	 ENV["gl_cv_func_getcwd_abort_bug"] = "no" if MacOS.version == :el_capitan
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-lispdir=#{elisp}"
	 system "make", "install"
