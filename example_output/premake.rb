name :
	 Premake
homepage :
	 https://premake.github.io/
url :
	 https://downloads.sourceforge.net/project/premake/Premake/4.4/premake-4.4-beta5-src.zip
description :
	 Write once, build anywhere Lua-based build system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 system "make", "-f", "Bootstrap.mak", "osx"
	 system "./premake5", "gmake"
	 end
	 system "make", "-C", "build/gmake.macosx"
	 if build.head?
	 bin.install "bin/release/premake5"
	 else
	 bin.install "bin/release/premake4"
	 end
