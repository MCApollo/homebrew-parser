name :
	 ErlangAT18
homepage :
	 https://www.erlang.org/
url :
	 https://github.com/erlang/otp/archive/OTP-18.3.4.11.tar.gz
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
	 https://raw.githubusercontent.com/Homebrew/formula-patches/774ad1f/erlang%4018/boring-ssl-high-sierra.patch
	 https://github.com/erlang/otp/commit/a64c4d806fa54848c35632114585ad82b98712e8.diff?full_index=1
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 ENV["erl_cv_clock_gettime_monotonic_default_resolution"] = "no"
	 ENV["erl_cv_clock_gettime_monotonic_try_find_pthread_compatible"] = "no"
	 ENV["erl_cv_clock_gettime_wall_default_resolution"] = "no"
	 end
	 %w[LIBS FLAGS AFLAGS ZFLAGS].each { |k| ENV.delete("ERL_#{k}") }
	 ENV["FOP"] = "#{HOMEBREW_PREFIX}/bin/fop" if build.with? "fop"
	 system "./otp_build", "autoconf" if File.exist? "otp_build"
	 args = %W[
	 --disable-debug
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-kernel-poll
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
	 if build.without? "hipe"
	 args << "--disable-hipe"
	 else
	 args << "--enable-hipe"
	 end
	 if build.with? "java"
	 args << "--with-javac"
	 else
	 args << "--without-javac"
	 end
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
	 (lib/"erlang").install resource("man").files("man")
	 doc.install resource("html")
