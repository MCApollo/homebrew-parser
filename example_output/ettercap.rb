name :
	 Ettercap
homepage :
	 https://ettercap.github.io/ettercap/
url :
description :
	 Multipurpose sniffer/interceptor/logger for switched LAN
build_deps :
	 cmake
link_deps :
	 curl
	 libnet
	 ncurses
	 openssl
	 pcre
	 gtk+
	 gtk+3
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DBUNDLED_LIBS=OFF
	 -DENABLE_CURSES=ON
	 -DENABLE_IPV6=ON
	 -DENABLE_LUA=OFF
	 -DENABLE_PDF_DOCS=OFF
	 -DENABLE_PLUGINS=ON
	 -DINSTALL_SYSCONFDIR=#{etc}
	 ]
	 if build.with?("gtk+") || build.with?("gtk+3")
	 args << "-DENABLE_GTK=ON" << "-DINSTALL_DESKTOP=ON"
	 args << "-DGTK_BUILD_TYPE=GTK3" if build.with? "gtk+3"
	 else
	 args << "-DENABLE_GTK=OFF" << "-DINSTALL_DESKTOP=OFF"