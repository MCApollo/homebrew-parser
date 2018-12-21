name :
	 Fceux
homepage :
	 http://fceux.com
url :
	 https://downloads.sourceforge.net/project/fceultra/Source%20Code/2.2.3%20src/fceux-2.2.3.src.tar.gz
description :
	 The all in one NES/Famicom Emulator
build_deps :
	 pkg-config
	 scons
link_deps :
	 gtk+3
	 sdl
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c126b2c/fceux/xcode9.patch
EOF_patch :
install :
	 inreplace "src/drivers/sdl/SConscript", "env.ParseConfig(config_string)", ""
	 scons "RELEASE=1", "GTK=0", "GTK3=1", "LOGO=0"
	 libexec.install "src/fceux"
	 pkgshare.install ["output/luaScripts", "output/palettes", "output/tools"]
	 (bin/"fceux").write <<~EOS
	 #!/bin/bash
	 LUA_PATH=#{pkgshare}/luaScripts/?.lua #{libexec}/fceux "$@"
	 EOS
