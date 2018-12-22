name :
	 OpenTyrian
homepage :
	 https://bitbucket.org/opentyrian/opentyrian
url :
	 https://www.camanis.net/opentyrian/releases/opentyrian-2.1.20130907-src.tar.gz
description :
	 Open-source port of Tyrian
build_deps :
link_deps :
	 sdl
	 sdl_net
conflicts :
patches :
EOF_patch :
install :
	 datadir = pkgshare/"data"
	 datadir.install resource("data")
	 args = []
	 if build.head?
	 args << "TYRIAN_DIR=#{datadir}"
	 else
	 inreplace "src/file.c", "/usr/share/opentyrian/data", datadir
	 end
	 system "make", *args
	 bin.install "opentyrian"
