name :
	 CrosstoolNg
homepage :
	 https://crosstool-ng.github.io/
url :
	 http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.23.0.tar.xz
description :
	 Tool for building toolchains
build_deps :
	 help2man
link_deps :
	 autoconf
	 automake
	 binutils
	 coreutils
	 flex
	 gawk
	 gnu-sed
	 grep
	 libtool
	 m4
	 make
	 ncurses
	 xz
	 bash
	 bison
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "./bootstrap"
	 ENV["BISON"] = "#{Formula["bison"].opt_bin}/bison"
	 ENV.append "LDFLAGS", "-lintl"
	 end
	 ENV["M4"] = "#{Formula["m4"].opt_bin}/m4"
	 ENV["MAKE"] = "#{Formula["make"].opt_bin}/gmake"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
