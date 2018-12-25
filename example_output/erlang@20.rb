name :
	 ErlangAT20
homepage :
	 https://www.erlang.org/
url :
	 https://github.com/erlang/otp/archive/OTP-20.3.8.15.tar.gz
description :
	 Programming language for highly scalable real-time systems
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
	 wxmac
optional_deps :
conflicts :
resource :
	 ['man', 'html']
	 ['https://www.erlang.org/download/otp_doc_man_20.3.tar.gz', 'https://www.erlang.org/download/otp_doc_html_20.3.tar.gz']
patches :
EOF_patch :
install :
	 %w[LIBS FLAGS AFLAGS ZFLAGS].each { |k| ENV.delete("ERL_#{k}") }
	 system "./otp_build", "autoconf" if File.exist? "otp_build"
	 args = %W[
	 --disable-debug
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-dynamic-ssl-lib
	 --enable-hipe
	 --enable-kernel-poll
	 --enable-sctp
	 --enable-shared-zlib
	 --enable-smp-support
	 --enable-threads
	 --enable-wx
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 --without-javac
	 ]
	 args << "--enable-darwin-64bit" if MacOS.prefer_64_bit?
	 args << "--with-dynamic-trace=dtrace" if MacOS::CLT.installed?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 (lib/"erlang").install resource("man").files("man")
	 doc.install resource("html")
