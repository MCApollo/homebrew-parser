name :
	 Erlang
homepage :
	 https://www.erlang.org/
url :
	 https://github.com/erlang/otp/archive/OTP-21.2.tar.gz
description :
	 Programming language for highly scalable real-time systems
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
	 wxmac
	 fop
	 :java
conflicts :
patches :
EOF_patch :
install :
	 %w[LIBS FLAGS AFLAGS ZFLAGS].each { |k| ENV.delete("ERL_#{k}") }
	 ENV["FOP"] = "#{HOMEBREW_PREFIX}/bin/fop" if build.with? "fop"
	 system "./otp_build", "autoconf" if File.exist? "otp_build"
	 args = %W[
	 --disable-debug
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-threads
	 --enable-sctp
	 --enable-dynamic-ssl-lib
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 --enable-shared-zlib
	 --enable-smp-support
	 ]
	 args << "--enable-darwin-64bit" if MacOS.prefer_64_bit?
	 args << "--enable-native-libs" if build.with? "native-libs"
	 args << "--enable-dirty-schedulers" if build.with? "dirty-schedulers"
	 args << "--enable-wx" if build.with? "wxmac"
	 args << "--with-dynamic-trace=dtrace" if MacOS::CLT.installed?
	 args << "--enable-kernel-poll" if MacOS.version > :el_capitan
	 if build.without? "hipe"
	 args << "--disable-hipe"
	 else
	 args << "--enable-hipe"
