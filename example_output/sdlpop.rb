name :
	 Sdlpop
homepage :
	 https://github.com/NagyD/SDLPoP
url :
	 https://github.com/NagyD/SDLPoP/archive/v1.18.1.tar.gz
description :
	 Open-source port of Prince of Persia
build_deps :
	 pkg-config
link_deps :
	 sdl2
	 sdl2_image
	 sdl2_mixer
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-C", "src"
	 doc.install Dir["doc/*"]
	 libexec.install "data"
	 libexec.install "prince"
	 pkgvar = var/"sdlpop"
	 pkgvar.install "SDLPoP.ini" unless (pkgvar/"SDLPoP.ini").exist?
	 (bin/"prince").write <<~EOS
	 #!/bin/bash
	 cd "#{pkgvar}" && exec "#{libexec}/prince" $@
	 EOS
