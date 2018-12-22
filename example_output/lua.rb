name :
	 Lua
homepage :
	 https://www.lua.org/
url :
	 https://www.lua.org/ftp/lua-5.3.5.tar.gz
description :
	 Powerful, lightweight programming language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/Makefile b/Makefile
	 index 7fa91c8..a825198 100644
	 --- a/Makefile
	 +++ b/Makefile
	 @@ -41,7 +41,7 @@ PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
	 TO_BIN= lua luac
	 TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
	 -TO_LIB= liblua.a
	 +TO_LIB= liblua.5.3.5.dylib
	 TO_MAN= lua.1 luac.1
	 @@ -63,6 +63,8 @@ install: dummy
	 cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
	 cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
	 cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
	 +	ln -s -f liblua.5.3.5.dylib $(INSTALL_LIB)/liblua.5.3.dylib
	 +	ln -s -f liblua.5.3.dylib $(INSTALL_LIB)/liblua.dylib
	 uninstall:
	 cd src && cd $(INSTALL_BIN) && $(RM) $(TO_BIN)
	 diff --git a/src/Makefile b/src/Makefile
	 index 2e7a412..d0c4898 100644
	 --- a/src/Makefile
	 +++ b/src/Makefile
	 @@ -28,7 +28,7 @@ MYOBJS=
	 PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
	 -LUA_A=	liblua.a
	 +LUA_A=	liblua.5.3.5.dylib
	 CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
	 lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
	 ltm.o lundump.o lvm.o lzio.o
	 @@ -56,11 +56,12 @@ o:	$(ALL_O)
	 a:	$(ALL_A)
	 $(LUA_A): $(BASE_O)
	 -	$(AR) $@ $(BASE_O)
	 -	$(RANLIB) $@
	 +	$(CC) -dynamiclib -install_name @LUA_PREFIX@/lib/liblua.5.3.dylib \
	 +		-compatibility_version 5.3 -current_version 5.3.5 \
	 +		-o liblua.5.3.5.dylib $^
	 $(LUA_T): $(LUA_O) $(LUA_A)
	 -	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
	 +	$(CC) -fno-common $(MYLDFLAGS) -o $@ $(LUA_O) $(LUA_A) -L. -llua.5.3.5 $(LIBS)
	 $(LUAC_T): $(LUAC_O) $(LUA_A)
	 $(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
	 @@ -110,7 +111,7 @@ linux:
	 $(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl -lreadline"
	 macosx:
	 -	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX" SYSLIBS="-lreadline"
	 +	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX -fno-common" SYSLIBS="-lreadline"
	 mingw:
	 $(MAKE) "LUA_A=lua53.dll" "LUA_T=lua.exe" \
install :
	 inreplace "src/Makefile" do |s|
	 s.gsub! "@LUA_PREFIX@", prefix
	 s.remove_make_var! "CC"
	 s.change_make_var! "CFLAGS", "#{ENV.cflags} -DLUA_COMPAT_5_2 $(SYSCFLAGS) $(MYCFLAGS)"
	 s.change_make_var! "MYLDFLAGS", ENV.ldflags
	 end
	 inreplace "src/luaconf.h", "/usr/local", HOMEBREW_PREFIX
	 system "make", "macosx", "INSTALL_TOP=#{prefix}", "INSTALL_INC=#{include}/lua", "INSTALL_MAN=#{man1}"
	 system "make", "install", "INSTALL_TOP=#{prefix}", "INSTALL_INC=#{include}/lua", "INSTALL_MAN=#{man1}"
	 (lib/"pkgconfig/lua.pc").write pc_file
	 bin.install_symlink "lua" => "lua5.3"
	 bin.install_symlink "lua" => "lua-5.3"
	 bin.install_symlink "luac" => "luac5.3"
	 bin.install_symlink "luac" => "luac-5.3"
	 (include/"lua5.3").install_symlink Dir[include/"lua/*"]
	 lib.install_symlink "liblua.5.3.dylib" => "liblua5.3.dylib"
	 (lib/"pkgconfig").install_symlink "lua.pc" => "lua5.3.pc"
	 (lib/"pkgconfig").install_symlink "lua.pc" => "lua-5.3.pc"