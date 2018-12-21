name :
	 Simutrans
homepage :
	 https://www.simutrans.com/
url :
	 https://downloads.sourceforge.net/project/simutrans/simutrans/120-4/simutrans-src-120-4.zip
description :
	 Transport simulator
build_deps :
link_deps :
	 libpng
	 :macos
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 args = %w[
	 BACKEND=sdl2
	 COLOUR_DEPTH=16
	 OSTYPE=mac
	 ]
	 args << "AV_FOUNDATION=1" if MacOS.version >= :sierra
	 system "make", *args
	 libexec.install "build/default/sim" => "simutrans"
	 libexec.install Dir["simutrans/*"]
	 bin.write_exec_script libexec/"simutrans"
	 libexec.install resource("pak64")
	 (libexec/"text").install resource("text")
	 system "make", "makeobj", *args
	 bin.install "build/default/makeobj/makeobj"
