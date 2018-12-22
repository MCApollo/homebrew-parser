name :
	 LuaAT51
homepage :
	 https://www.lua.org/
url :
	 https://www.lua.org/ftp/lua-5.1.5.tar.gz
description :
	 Powerful, lightweight programming language (v5.1.5)
build_deps :
link_deps :
conflicts :
patches :
	 http://lua-users.org/files/wiki_insecure/power_patches/5.1/sig_catch.patch
	 https://luajit.org/patches/lua-5.1.4-advanced_readline.patch
EOF_patch :
	 diff --git a/Makefile b/Makefile
	 index 209a132..9387b09 100644
	 --- a/Makefile
	 +++ b/Makefile
	 @@ -43,7 +43,7 @@ PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
	 TO_BIN= lua luac
	 TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
	 -TO_LIB= liblua.a
	 +TO_LIB= liblua.5.1.5.dylib
	 TO_MAN= lua.1 luac.1
	 @@ -64,6 +64,8 @@ install: dummy
	 cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
	 cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
	 cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
	 +	ln -s -f liblua.5.1.5.dylib $(INSTALL_LIB)/liblua.5.1.dylib
	 +	ln -s -f liblua.5.1.dylib $(INSTALL_LIB)/liblua5.1.dylib
	 ranlib:
	 cd src && cd $(INSTALL_LIB) && $(RANLIB) $(TO_LIB)
	 diff --git a/src/Makefile b/src/Makefile
	 index e0d4c9f..4477d7b 100644
	 --- a/src/Makefile
	 +++ b/src/Makefile
	 @@ -22,7 +22,7 @@ MYLIBS=
	 PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
	 -LUA_A=	liblua.a
	 +LUA_A=	liblua.5.1.5.dylib
	 CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
	 lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
	 lundump.o lvm.o lzio.o
	 @@ -48,11 +48,13 @@ o:	$(ALL_O)
	 a:	$(ALL_A)
	 $(LUA_A): $(CORE_O) $(LIB_O)
	 -	$(AR) $@ $(CORE_O) $(LIB_O)
	 -	$(RANLIB) $@
	 +	$(CC) -dynamiclib -install_name @LUA_PREFIX@/lib/liblua.5.1.dylib \
	 +		-compatibility_version 5.1 -current_version 5.1.5 \
	 +		-o liblua.5.1.5.dylib $^
	 $(LUA_T): $(LUA_O) $(LUA_A)
	 -	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
	 +	$(CC) -fno-common $(MYLDFLAGS) \
	 +		-o $@ $(LUA_O) $(LUA_A) -L. -llua.5.1.5 $(LIBS)
	 $(LUAC_T): $(LUAC_O) $(LUA_A)
	 $(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
	 @@ -99,7 +101,7 @@ linux:
	 $(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
	 macosx:
	 -	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-lreadline"
	 +	$(MAKE) all MYCFLAGS="MYCFLAGS_VAL" MYLIBS="-lreadline"
	 #	$(MAKE) all MYCFLAGS=-DLUA_USE_MACOSX
install :
	 inreplace "src/Makefile" do |s|
	 s.gsub! "@LUA_PREFIX@", prefix
	 s.remove_make_var! "CC"
	 s.change_make_var! "CFLAGS", "#{ENV.cflags} $(MYCFLAGS)"
	 s.change_make_var! "MYLDFLAGS", ENV.ldflags
	 s.sub! "MYCFLAGS_VAL", "-fno-common -DLUA_USE_LINUX"
	 end
	 inreplace "src/luaconf.h", "/usr/local", HOMEBREW_PREFIX
	 inreplace "etc/lua.pc" do |s|
	 s.gsub! "prefix= /usr/local", "prefix=#{HOMEBREW_PREFIX}"
	 s.gsub! "INSTALL_MAN= ${prefix}/man/man1", "INSTALL_MAN= ${prefix}/share/man/man1"
	 s.gsub! "INSTALL_INC= ${prefix}/include", "INSTALL_INC= ${prefix}/include/lua-5.1"
	 s.gsub! "includedir=${prefix}/include", "includedir=${prefix}/include/lua-5.1"
	 s.gsub! "Libs: -L${libdir} -llua -lm", "Libs: -L${libdir} -llua.5.1 -lm"
	 end
	 system "make", "macosx", "INSTALL_TOP=#{prefix}", "INSTALL_MAN=#{man1}", "INSTALL_INC=#{include}/lua-5.1"
	 system "make", "install", "INSTALL_TOP=#{prefix}", "INSTALL_MAN=#{man1}", "INSTALL_INC=#{include}/lua-5.1"
	 (lib/"pkgconfig").install "etc/lua.pc"
	 mv bin/"lua", bin/"lua-5.1"
	 mv bin/"luac", bin/"luac-5.1"
	 mv man1/"lua.1", man1/"lua-5.1.1"
	 mv man1/"luac.1", man1/"luac-5.1.1"
	 mv lib/"pkgconfig/lua.pc", lib/"pkgconfig/lua-5.1.pc"
	 bin.install_symlink "lua-5.1" => "lua5.1"
	 bin.install_symlink "luac-5.1" => "luac5.1"
	 include.install_symlink "lua-5.1" => "lua5.1"
	 (lib/"pkgconfig").install_symlink "lua-5.1.pc" => "lua5.1.pc"
	 (libexec/"lib/pkgconfig").install_symlink lib/"pkgconfig/lua-5.1.pc" => "lua.pc"
