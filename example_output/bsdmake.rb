name :
	 Bsdmake
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/bsdmake/bsdmake-24.tar.gz
description :
	 BSD make (build tool)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/1fcaddfc/bsdmake/patch-Makefile.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/1fcaddfc/bsdmake/patch-mk.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/1fcaddfc/bsdmake/patch-pathnames.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/1fcaddfc/bsdmake/patch-setrlimit.diff
EOF_patch :
install :
	 inreplace "mk/sys.mk", "@PREFIX@", MacOS::X11.prefix || prefix
	 inreplace %w[mk/bsd.README
	 mk/bsd.cpu.mk
	 mk/bsd.doc.mk
	 mk/bsd.obj.mk
	 mk/bsd.own.mk
	 mk/bsd.port.mk
	 mk/bsd.port.subdir.mk
	 pathnames.h],
	 "@PREFIX@", prefix
	 inreplace "mk/bsd.own.mk" do |s|
	 s.gsub! "@INSTALL_USER@", `id -un`.chomp
	 s.gsub! "@INSTALL_GROUP@", `id -gn`.chomp
	 end
	 ENV.append "CFLAGS", "-D__FBSDID=__RCSID"
	 ENV.append "CFLAGS", "-mdynamic-no-pic"
	 system "make", "-f", "Makefile.dist"
	 bin.install "pmake" => "bsdmake"
	 man1.install "make.1" => "bsdmake.1"
	 (share/"mk/bsdmake").install Dir["mk/*"]
