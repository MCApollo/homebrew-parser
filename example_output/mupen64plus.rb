name :
	 Mupen64plus
homepage :
	 https://www.mupen64plus.org/
url :
	 https://github.com/mupen64plus/mupen64plus-core/releases/download/2.5/mupen64plus-bundle-src-2.5.tar.gz
description :
	 Cross-platform plugin-based N64 emulator
build_deps :
	 pkg-config
link_deps :
	 boost
	 freetype
	 libpng
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 inreplace Dir["source/mupen64plus-**/projects/unix/Makefile"], /(-mmacosx-version-min)=\d+\.\d+/, "\\1=#{MacOS.version}"
	 inreplace "source/mupen64plus-video-glide64mk2/src/Glide64/3dmath.cpp",
	 "__builtin_ia32_storeups", "_mm_storeu_ps"
	 args = ["install", "PREFIX=#{prefix}", "INSTALL_STRIP_FLAG=-S"]
	 cd "source/mupen64plus-core/projects/unix" do
	 system "make", *args
