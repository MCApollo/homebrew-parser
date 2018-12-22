name :
	 Radare2
homepage :
	 https://radare.org
url :
	 https://radare.mikelloc.com/get/2.8.0/radare2-2.8.0.tar.gz
description :
	 Reverse engineering framework
build_deps :
	 gobject-introspection
	 pkg-config
	 swig
	 valabind
link_deps :
	 :codesign
	 gmp
	 jansson
	 libewf
	 libmagic
	 lua
	 openssl
	 yara
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-openssl"
	 system "make", "CS_PATCHES=0"
	 if build.with? "code-signing"
	 home = `eval printf "~$USER"`
	 system "make", "HOME=#{home}", "-C", "binr/radare2", "macossign"
	 system "make", "HOME=#{home}", "-C", "binr/radare2", "macos-sign-libs"
	 end
	 ENV.deparallelize { system "make", "install" }
	 rm_f bin/"r2-docker"
	 rm_f bin/"r2-indent"
	 resource("extras").stage do
	 ENV.append_path "PATH", bin
	 ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	 (lib/"radare2/#{version}").mkpath
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "R2PM_PLUGDIR=#{lib}/radare2/#{version}", "all"
	 system "make", "R2PM_PLUGDIR=#{lib}/radare2/#{version}", "install"
	 end
	 resource("bindings").stage do
	 ENV.append_path "PATH", bin
	 ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	 perl_version = `/usr/bin/perl -e 'printf "%vd", $^V;'`
	 lua_version = Formula["lua"].version.to_s.match(/\d\.\d/)
	 inreplace "do-swig.sh", "VALABINDFLAGS=\"\"", "VALABINDFLAGS=\"--nolibpython\""
	 make_binding_args = ["CFLAGS=-undefined dynamic_lookup"]
	 inreplace "libr/lang/p/Makefile" do |s|
	 s.gsub! "R2_PLUGIN_PATH=", "#R2_PLUGIN_PATH="
	 s.gsub! "~/.config/radare2/plugins", "#{lib}/radare2/#{version}"
	 end
	 inreplace "libr/lang/p/lua.c",
	 'os.getenv(\"HOME\")..\"/.config/radare2/plugins/lua/?.lua;',
	 "\\\"#{libexec}/lua/#{lua_version}/?.lua;"
	 inreplace "Makefile" do |s|
	 s.gsub! "LUAPKG=", "#LUAPKG="
	 s.gsub! "${DESTDIR}$$_LUADIR", "#{lib}/lua/#{lua_version}"
	 s.gsub! "ls lua/*so*$$_LUAVER", "ls lua/*so"
	 end
	 make_install_args = %W[
	 R2_PLUGIN_PATH=#{lib}/radare2/#{version}
	 LUAPKG=lua-#{lua_version}
	 PERLPATH=#{lib}/perl5/site_perl/#{perl_version}
	 PYTHON_PKGDIR=#{lib}/python2.7/site-packages
	 RUBYPATH=#{lib}/ruby/#{RUBY_VERSION}
	 ]
	 system "./configure", "--prefix=#{prefix}"
	 ["lua", "perl", "python"].each do |binding|
	 system "make", "-C", binding, *make_binding_args
	 end
	 system "make"
	 system "make", "install", *make_install_args
	 (libexec/"lua/#{lua_version}").install Dir["libr/lang/p/lua/*.lua"]
	 end
