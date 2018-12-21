name :
	 GnuApl
homepage :
	 https://www.gnu.org/software/apl/
url :
	 https://ftp.gnu.org/gnu/apl/apl-1.7.tar.gz
description :
	 GNU implementation of the programming language APL
build_deps :
link_deps :
	 :macos
	 readline
	 libpq
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT") if DevelopmentTools.clang_build_version >= 900
	 system "autoreconf", "-fiv" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
