name :
	 Sdl
homepage :
	 https://www.libsdl.org/
url :
	 https://www.libsdl.org/release/SDL-1.2.15.tar.gz
description :
	 Low-level access to audio, keyboard, mouse, joystick and graphics
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://bugzilla-attachments.libsdl.org/attachment.cgi?id=1320
	 https://bugzilla-attachments.libsdl.org/attachment.cgi?id=1324
EOF_patch :
install :
	 inreplace %w[sdl.pc.in sdl-config.in], "@prefix@", HOMEBREW_PREFIX
	 system "./autogen.sh" if build.head?
	 args = %W[--prefix=#{prefix} --without-x]
	 args << "--disable-nasm" unless MacOS.version >= :mountain_lion
	 if ENV.compiler == :clang && DevelopmentTools.clang_build_version < 421
	 args << "--disable-assembly"
	 end
	 system "./configure", *args
	 system "make", "install"
	 libexec.install Dir["src/main/macosx/*"] if build.stable?
