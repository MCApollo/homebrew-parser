name :
	 Pmdmini
homepage :
	 https://github.com/mistydemeo/pmdmini
url :
	 https://github.com/mistydemeo/pmdmini/archive/v1.0.1.tar.gz
description :
	 Plays music in PC-88/98 PMD chiptune format
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 ['test_song']
	 ['https://ftp.modland.com/pub/modules/PMD/Shiori%20Ueno/His%20Name%20Is%20Diamond/dd06.m']
patches :
EOF_patch :
install :
	 inreplace "mak/general.mak", "gcc", ENV.cc
	 system "make"
	 system "#{ENV.cc} -dynamiclib -install_name #{lib}/libpmdmini.dylib -o libpmdmini.dylib -undefined dynamic_lookup obj/*.o"
	 bin.install "pmdplay"
	 lib.install "libpmdmini.a", "libpmdmini.dylib"
	 (include+"libpmdmini").install Dir["src/*.h"]
	 (include+"libpmdmini/pmdwin").install Dir["src/pmdwin/*.h"]
