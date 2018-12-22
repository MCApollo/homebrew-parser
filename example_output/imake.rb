name :
	 Imake
homepage :
	 https://xorg.freedesktop.org
url :
	 https://xorg.freedesktop.org/releases/individual/util/imake-1.0.7.tar.bz2
description :
	 Build automation system written for X11
build_deps :
	 pkg-config
link_deps :
	 gcc
	 :x11
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/patches/a0bb3a4/imake/patch-imakemdep.h.diff
EOF_patch :
install :
	 ENV.deparallelize
	 cpp_program = Formula["gcc"].opt_bin/"cpp-#{Formula["gcc"].version_suffix}"
	 inreplace "imakemdep.h", /::CPPCMD::/, cpp_program
	 inreplace "imake.man", /__cpp__/, cpp_program
	 ENV["RAWCPP"] = cpp_program
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
	 resource("xorg-cf-files").stage do
	 inreplace "X11.rules", "define TopXInclude	/**/",
	 "define TopXInclude	-I#{MacOS::X11.include}"
	 system "./configure", "--with-config-dir=#{lib}/X11/config",
	 "--prefix=#{HOMEBREW_PREFIX}"
	 system "make", "install"
	 end
