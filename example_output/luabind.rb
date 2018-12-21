name :
	 Luabind
homepage :
	 https://github.com/luabind/luabind
url :
	 https://downloads.sourceforge.net/project/luabind/luabind/0.9.1/luabind-0.9.1.tar.gz
description :
	 Library for bindings between C++ and Lua
build_deps :
	 boost-build
link_deps :
	 boost
	 lua@5.1
conflicts :
patches :
	 https://gist.githubusercontent.com/tdsmith/e6d9d3559ec1d9284c0b/raw/4ac01936561ef9d7541cf8e78a230bebef1a8e10/luabind.diff
	 https://gist.githubusercontent.com/DennisOSRM/3728987/raw/052251fcdc23602770f6c543be9b3e12f0cac50a/Jamroot.diff
	 https://github.com/luabind/luabind/commit/3044a9053ac50977684a75c4af42b2bddb853fad.diff?full_index=1
	 https://gist.githubusercontent.com/DennisOSRM/a246514bf7d01631dda8/raw/0e83503dbf862ebfb6ac063338a6d7bca793f94d/object_rep.diff
EOF_patch :
install :
	 ENV["LUA_PATH"] = Formula["lua@5.1"].opt_prefix
	 args = %w[release install]
	 if ENV.compiler == :clang
	 args << "--toolset=clang"
	 elsif ENV.compiler == :gcc
	 args << "--toolset=darwin"
