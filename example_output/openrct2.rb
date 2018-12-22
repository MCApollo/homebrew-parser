name :
	 Openrct2
homepage :
	 https://openrct2.io/
url :
	 https://github.com/OpenRCT2/OpenRCT2.git
description :
	 Open source re-implementation of RollerCoaster Tycoon 2
build_deps :
	 cmake
	 pkg-config
link_deps :
	 freetype
	 icu4c
	 jansson
	 libpng
	 libzip
	 :macos
	 openssl
	 sdl2
	 sdl2_ttf
	 speexdsp
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"data/title").install resource("title-sequences")
	 (buildpath/"data/object").install resource("objects")
	 tversion = resource("title-sequences").version
	 mv buildpath/"data/title/title-sequence-v#{tversion}.zip", "title-sequences.zip"
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
	 libexec.install bin/"openrct2"
	 (bin/"openrct2").write <<~EOS
	 #!/bin/bash
	 exec "#{libexec}/openrct2" "$@" "--openrct-data-path=#{pkgshare}"
	 EOS
