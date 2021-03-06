name :
	 Mdxmini
homepage :
	 https://clogging.web.fc2.com/psp/
url :
	 https://github.com/mistydemeo/mdxmini/archive/v1.0.0.tar.gz
description :
	 Plays music in X68000 MDX chiptune format
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 ['test_song']
	 ['https://ftp.modland.com/pub/modules/MDX/-%20unknown/Popful%20Mail/pop-00.mdx']
patches :
EOF_patch :
install :
	 inreplace "mak/general.mak", "gcc", ENV.cc
	 system "make"
	 system ENV.cc, "-dynamiclib", "-install_name", "#{lib}/libmdxmini.dylib",
	 "-o", "libmdxmini.dylib", "-undefined", "dynamic_lookup",
	 *Dir["obj/*"]
	 bin.install "mdxplay"
	 lib.install "libmdxmini.dylib"
	 (include/"libmdxmini").install Dir["src/*.h"]
