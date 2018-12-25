name :
	 Hatari
homepage :
	 https://hatari.tuxfamily.org
url :
	 https://download.tuxfamily.org/hatari/2.1.0/hatari-2.1.0.tar.bz2
description :
	 Atari ST/STE/TT/Falcon emulator
build_deps :
	 cmake
link_deps :
	 libpng
	 portaudio
	 sdl2
optional_deps :
conflicts :
resource :
	 ['emutos']
	 ['https://downloads.sourceforge.net/project/emutos/emutos/0.9.9.1/emutos-512k-0.9.9.1.zip']
patches :
	 https://hg.tuxfamily.org/mercurialroot/hatari/hatari/raw-rev/21bc2b0ebae4
EOF_patch :
install :
	 inreplace "src/CMakeLists.txt", "/Applications", prefix
	 system "cmake", *std_cmake_args
	 system "make"
	 prefix.install "src/Hatari.app"
	 bin.write_exec_script "#{prefix}/Hatari.app/Contents/MacOS/hatari"
	 resource("emutos").stage do
	 (prefix/"Hatari.app/Contents/Resources").install "etos512k.img" => "tos.img"
	 end
