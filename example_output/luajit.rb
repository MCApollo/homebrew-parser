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
	 end
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 ENV.O2
	 args = %W[PREFIX=#{prefix}]
	 args << "XCFLAGS=-DLUAJIT_ENABLE_GC64" if build.head?
	 system "make", "amalg", *args
	 system "make", "install", *args
	 lib.install_symlink lib/"libluajit-5.1.dylib" => "libluajit.dylib"
	 lib.install_symlink lib/"libluajit-5.1.a" => "libluajit.a"
	 inreplace lib/"pkgconfig/luajit.pc" do |s|
	 s.gsub! "INSTALL_LMOD=${prefix}/share/lua/${abiver}",
	 "INSTALL_LMOD=#{HOMEBREW_PREFIX}/share/lua/${abiver}"
	 s.gsub! "INSTALL_CMOD=${prefix}/${multilib}/lua/${abiver}",
	 "INSTALL_CMOD=#{HOMEBREW_PREFIX}/${multilib}/lua/${abiver}"
	 unless build.head?
	 s.gsub! "Libs:",
	 "Libs: -pagezero_size 10000 -image_base 100000000"
	 end
