name :
	 Httest
homepage :
	 https://htt.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/htt/htt2.4/httest-2.4.23/httest-2.4.23.tar.gz
description :
	 Provides a large variety of HTTP-related test functionality
build_deps :
link_deps :
	 apr
	 apr-util
	 lua@5.1
	 nghttp2
	 openssl
	 pcre
	 spidermonkey
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure",
	 "else LUA_LIB_PATH=\"-L${withval}\"; LUA_INCLUDES=\"-I${withval}\"; LUA_LIB=\"-llua\"; fi",
	 "else LUA_LIB_PATH=\"-L${withval}/lib\"; LUA_INCLUDES=\"-I${withval}/include/lua-5.1\"; LUA_LIB=\"-llua.5.1\"; fi"
	 (buildpath/"brew_include").install_symlink Formula["pcre"].opt_include => "pcre"
	 ENV.prepend "CPPFLAGS", "-I#{buildpath}/brew_include"
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-h2-module",
	 "--enable-html-module",
	 "--enable-js-module",
	 "--enable-lua-module",
	 "--enable-xml-module",
	 "--with-apr=#{Formula["apr"].opt_bin}",
	 "--with-lua=#{Formula["lua@5.1"].opt_prefix}"
	 system "make", "install"
