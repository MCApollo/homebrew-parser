name :
	 Ncmpc
homepage :
	 https://www.musicpd.org/clients/ncmpc/
url :
	 https://www.musicpd.org/download/ncmpc/0/ncmpc-0.30.tar.xz
description :
	 Curses Music Player Daemon (MPD) client
build_deps :
	 meson
	 ninja
	 pkg-config
link_deps :
	 gcc
	 gettext
	 glib
	 libmpdclient
conflicts :
patches :
EOF_patch :
install :
	 sdk = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 (buildpath/"ncurses.pc").write <<~EOS
	 Name: ncurses
	 Description: ncurses
	 Version: 5.4
	 Libs: -L/usr/lib -lncurses
	 Cflags: -I#{sdk}/usr/include
	 EOS
	 ENV.prepend_path "PKG_CONFIG_PATH", buildpath
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja", "install"
