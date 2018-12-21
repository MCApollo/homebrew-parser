name :
	 Makensis
homepage :
	 https://nsis.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/nsis/NSIS%203/3.03/nsis-3.03-src.tar.bz2
description :
	 System to create Windows installers
build_deps :
	 mingw-w64
	 scons
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = [
	 "CC=#{ENV.cc}",
	 "CXX=#{ENV.cxx}",
	 "PREFIX_DOC=#{share}/nsis/Docs",
	 "SKIPUTILS=Makensisw,NSIS Menu,zip2exe",
	 "STRIP=0",
	 "VERSION=#{version}",
	 ]
	 scons "makensis", *args
	 bin.install "build/urelease/makensis/makensis"
	 (share/"nsis").install resource("nsis")
