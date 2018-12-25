name :
	 Luaradio
homepage :
	 http://luaradio.io/
url :
	 https://github.com/vsergeev/luaradio/archive/v0.5.1.tar.gz
description :
	 Lightweight, embeddable flow graph signal processing framework for SDR
build_deps :
	 pkg-config
link_deps :
	 fftw
	 luajit
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "embed" do
	 inreplace "Makefile" do |s|
	 s.gsub! "install -d $(DESTDIR)$(INSTALL_CMOD)",
	 "install -d $(PREFIX)/lib/lua/5.1"
	 s.gsub! "$(DESTDIR)$(INSTALL_CMOD)/radio.so",
	 "$(PREFIX)/lib/lua/5.1/radio.so"
	 end
	 system "make", "install", "PREFIX=#{prefix}"
	 end
