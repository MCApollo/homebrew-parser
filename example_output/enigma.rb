name :
	 Enigma
homepage :
	 https://www.nongnu.org/enigma/
url :
	 https://downloads.sourceforge.net/project/enigma-game/Release%201.21/enigma-1.21.tar.gz
description :
	 Puzzle game inspired by Oxyd and Rock'n'Roll
build_deps :
	 autoconf
	 automake
	 imagemagick
	 pkg-config
link_deps :
	 enet
	 freetype
	 gettext
	 libpng
	 sdl
	 sdl_image
	 sdl_mixer
	 sdl_ttf
	 xerces-c
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/master/enigma/c%2B%2B11.patch
EOF_patch :
install :
	 ENV.cxx11
	 system "./autogen.sh" if build.head?
	 inreplace "configure" do |s|
	 s.gsub! /-framework (SDL(_(mixer|image|ttf))?)/, '-l\1'
	 s.gsub! %r{\${\w+//\\"/}/lib(freetype|png|xerces-c)\.a}, '-l\1'
	 s.gsub! %r{(LIBINTL)="\${with_libintl_prefix}/lib/lib(intl)\.a"}, '\1=-l\2'
	 s.gsub! /^\s+LIBENET_CFLAGS\n.*LIBENET.*\n\s+LIBENET_LIBS\n.*LIBENET.*$/, ""
	 end
	 inreplace "src/Makefile.in" do |s|
	 s.gsub! %r{(cp -a /Library/Frameworks/.*)$}, 'echo \1'
	 s.gsub! "mkalias -r", "ln -s"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-libintl-prefix=#{Formula["gettext"].opt_prefix}",
	 "--with-system-enet"
	 system "make"
	 system "make", "macapp"
	 prefix.install "etc/macfiles/Enigma.app"
	 bin.write_exec_script "#{prefix}/Enigma.app/Contents/MacOS/enigma"
