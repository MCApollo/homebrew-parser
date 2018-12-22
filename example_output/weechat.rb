name :
	 Weechat
homepage :
	 https://www.weechat.org
url :
	 https://weechat.org/files/src/weechat-2.3.tar.xz
description :
	 Extensible IRC client
build_deps :
	 asciidoctor
	 cmake
	 pkg-config
link_deps :
	 gettext
	 gnutls
	 libgcrypt
	 aspell
	 curl
	 lua
	 perl
	 python@2
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DENABLE_MAN=ON
	 -DENABLE_GUILE=OFF
	 -DCA_FILE=#{etc}/openssl/cert.pem
	 -DENABLE_JAVASCRIPT=OFF
	 ]
	 if build.without? "ruby"
	 args << "-DENABLE_RUBY=OFF"
	 elsif build.with?("ruby") && MacOS.version >= :sierra
	 args << "-DRUBY_EXECUTABLE=/usr/bin/ruby"
	 args << "-DRUBY_LIB=/usr/lib/libruby.dylib"
	 end
	 args << "-DENABLE_LUA=OFF" if build.without? "lua"
	 args << "-DENABLE_PERL=OFF" if build.without? "perl"
	 args << "-DENABLE_ASPELL=OFF" if build.without? "aspell"
	 args << "-DENABLE_PYTHON=OFF" if build.without? "python@2"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install", "VERBOSE=1"
	 end
