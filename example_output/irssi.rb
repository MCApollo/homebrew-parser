name :
	 Irssi
homepage :
	 https://irssi.org/
url :
	 https://github.com/irssi/irssi/releases/download/1.1.1/irssi-1.1.1.tar.xz
description :
	 Modular IRC client
build_deps :
	 pkg-config
link_deps :
	 glib
	 openssl
optional_deps :
	 dante
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --with-bot
	 --with-proxy
	 --enable-true-color
	 --with-socks=#{build.with?("dante") ? "yes" : "no"}
	 --with-ncurses=#{MacOS.sdk_path}/usr
	 --with-perl=yes
	 --with-perl-lib=#{lib}/perl5/site_perl
	 ]
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh", *args
	 end
	 inreplace "configure", "^DUIfm", "^DUIifm"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
