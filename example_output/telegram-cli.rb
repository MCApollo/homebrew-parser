name :
	 TelegramCli
homepage :
	 https://github.com/vysheng/tg
url :
	 https://github.com/vysheng/tg.git
description :
	 Command-line interface for Telegram
build_deps :
	 pkg-config
link_deps :
	 jansson
	 libconfig
	 libevent
	 openssl
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/vysheng/tg/pull/1306.patch?full_index=1
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 CFLAGS=-I#{Formula["readline"].include}
	 CPPFLAGS=-I#{Formula["readline"].include}
	 LDFLAGS=-L#{Formula["readline"].lib}
	 --disable-liblua
	 --disable-python
	 ]
	 system "./configure", *args
	 system "make"
	 bin.install "bin/telegram-cli" => "telegram"
	 (etc/"telegram-cli").install "server.pub"
