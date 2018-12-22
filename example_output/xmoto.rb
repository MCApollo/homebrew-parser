name :
	 Xmoto
homepage :
	 https://xmoto.tuxfamily.org/
url :
	 https://download.tuxfamily.org/xmoto/xmoto/0.5.11/xmoto-0.5.11-src.tar.gz
description :
	 2D motocross platform game
build_deps :
link_deps :
	 gettext
	 jpeg
	 libpng
	 libxdg-basedir
	 libxml2
	 lua@5.1
	 ode
	 sdl
	 sdl_mixer
	 sdl_net
	 sdl_ttf
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-DdSINGLE"
	 ENV.prepend "CPPFLAGS", "-I#{Formula["lua@5.1"].opt_include}/lua-5.1"
	 ENV.append "LDFLAGS", "-L#{Formula["lua@5.1"].opt_lib} -llua.5.1"
	 inreplace "src/glext.h", "unsigned int GLhandleARB", "void *GLhandleARB"
	 inreplace "src/include/xm_hashmap.h" do |s|
	 if build.head?
	 s.gsub! "tr1/", ""
	 s.gsub! "::tr1", ""
	 else
	 s.gsub! "s2) {", "s2) const {"
	 end
