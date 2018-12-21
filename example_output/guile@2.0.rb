name :
	 GuileAT20
homepage :
	 https://www.gnu.org/software/guile/
url :
	 https://ftp.gnu.org/gnu/guile/guile-2.0.14.tar.xz
description :
	 GNU Ubiquitous Intelligent Language for Extensions
build_deps :
link_deps :
	 bdw-gc
	 gmp
	 libffi
	 libtool
	 libunistring
	 pkg-config
	 readline
conflicts :
patches :
	 https://raw.githubusercontent.com/macports/macports-ports/5a3bba7/lang/guile/files/sierra.patch
	 https://raw.githubusercontent.com/macports/macports-ports/8b7f401/lang/guile/files/sierra-filter-incompatible-mkostemp-flags.patch
EOF_patch :
install :
	 system "./autogen.sh" unless build.stable?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-libreadline-prefix=#{Formula["readline"].opt_prefix}",
	 "--with-libgmp-prefix=#{Formula["gmp"].opt_prefix}"
	 system "make", "install"
	 Pathname.glob("#{lib}/*.dylib") do |dylib|
	 lib.install_symlink dylib.basename => "#{dylib.basename(".dylib")}.so"
