name :
	 Abuse
homepage :
	 http://abuse.zoy.org/
url :
	 http://abuse.zoy.org/raw-attachment/wiki/download/abuse-0.8.tar.gz
description :
	 Dark 2D side-scrolling platform game
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libvorbis
	 sdl
	 sdl_mixer
conflicts :
patches :
EOF_patch :
install :
	 inreplace "bootstrap", "11 10 9 8 7 6 5", '$(seq -s " " 5 99)'
	 inreplace "bootstrap",
	 "aclocal${amvers} ${aclocalflags}",
	 "aclocal${amvers} ${aclocalflags} -I#{HOMEBREW_PREFIX}/share/aclocal"
	 inreplace "src/net/fileman.cpp", "ushort", "unsigned short"
	 inreplace "src/sdlport/setup.cpp", "UInt8", "uint8_t"
	 inreplace "configure.ac", "AM_CONFIG_HEADER", "AC_CONFIG_HEADERS"
	 inreplace "configure.ac",
	 "#error\t/* Error so the compile fails on OSX */",
	 "#include <OpenGL/gl.h>"
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--disable-sdltest",
	 "--with-assetdir=#{pkgshare}",
	 "--with-sdl-prefix=#{Formula["sdl"].opt_prefix}"
	 %w[. src src/imlib src/lisp src/net src/sdlport].each do |p|
	 inreplace "#{p}/Makefile", "-lGL", "-framework OpenGL"
