name :
	 Guile
homepage :
	 https://www.gnu.org/software/guile/
url :
	 https://ftp.gnu.org/gnu/guile/guile-2.2.4.tar.xz
description :
	 GNU Ubiquitous Intelligent Language for Extensions
build_deps :
	 gnu-sed
link_deps :
	 bdw-gc
	 gmp
	 libffi
	 libtool
	 libunistring
	 pkg-config
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
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
	 end
	 inreplace lib/"pkgconfig/guile-2.2.pc" do |s|
	 s.gsub! Formula["bdw-gc"].prefix.realpath, Formula["bdw-gc"].opt_prefix
	 s.gsub! Formula["libffi"].prefix.realpath, Formula["libffi"].opt_prefix
	 end
	 (share/"gdb/auto-load").install Dir["#{lib}/*-gdb.scm"]
