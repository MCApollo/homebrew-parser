name :
	 Luajit
homepage :
	 https://luajit.org/luajit.html
url :
	 https://luajit.org/download/LuaJIT-2.0.5.tar.gz
description :
	 Just-In-Time Compiler (JIT) for the Lua programming language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/Makefile" do |f|
	 f.change_make_var! "CC", ENV.cc
	 f.change_make_var! "CCOPT_x86", ""
