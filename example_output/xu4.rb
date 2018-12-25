name :
	 Xu4
homepage :
	 https://xu4.sourceforge.io/
url :
	 3088
description :
	 Remake of Ultima IV
build_deps :
link_deps :
	 libpng
	 sdl
	 sdl_mixer
optional_deps :
conflicts :
resource :
	 ['ultima4', 'u4upgrad']
	 ['https://www.thatfleminggent.com/ultima/ultima4.zip', 'https://downloads.sourceforge.net/project/xu4/Ultima%204%20VGA%20Upgrade/1.3/u4upgrad.zip']
patches :
EOF_patch :
install :
	 (buildpath/"src").install resource("ultima4")
	 (buildpath/"src").install resource("u4upgrad")
	 cd "src" do
	 inreplace "Makefile.macosx", /
	 cp_r Dir[Formula["sdl"].libexec/"*"], "macosx"
	 system "make", "bundle",
	 "-f", "Makefile.macosx",
	 "CC=#{ENV.cc}",
	 "CXX=#{ENV.cxx}",
	 "PREFIX=#{HOMEBREW_PREFIX}",
	 "UILIBS=-framework Cocoa -L#{Formula["sdl"].lib} -lSDL " \
	 "-L#{Formula["sdl_mixer"].lib} -lSDL_mixer " \
	 "-L#{Formula["libpng"].lib} -lpng",
	 "UIFLAGS=-I#{Formula["sdl"].include}/SDL " \
	 "-I#{Formula["sdl_mixer"].include}/SDL " \
	 "-I#{Formula["libpng"].include}"
	 prefix.install "XU4.app"
	 bin.write_exec_script "#{prefix}/XU4.app/Contents/MacOS/u4"
	 end
