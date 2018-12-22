name :
	 Sdl2
homepage :
	 https://www.libsdl.org/
url :
	 https://libsdl.org/release/SDL2-2.0.9.tar.gz
description :
	 Low-level access to audio, keyboard, mouse, joystick, and graphics
build_deps :
link_deps :
conflicts :
patches :
	 https://hg.libsdl.org/SDL/raw-diff/d274fa9731b1/build-scripts/ltmain.sh
	 https://gist.githubusercontent.com/miniupnp/26d6e967570e5729a757/raw/1a86f3cdfadbd9b74172716abd26114d9cb115d5/SDL2-2.0.3_OSX_104.patch
EOF_patch :
install :
	 inreplace %w[sdl2.pc.in sdl2-config.in], "@prefix@", HOMEBREW_PREFIX
	 system "./autogen.sh" if build.head? || build.devel?
	 args = %W[--prefix=#{prefix} --without-x]
	 if ENV.compiler == :clang && DevelopmentTools.clang_build_version < 421
	 args << "--disable-assembly"
	 end
	 args << "--disable-haptic" << "--disable-joystick" if MacOS.version <= :snow_leopard
	 system "./configure", *args
	 system "make", "install"
