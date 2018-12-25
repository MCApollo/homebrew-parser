name :
	 Spidermonkey
homepage :
	 https://developer.mozilla.org/en/SpiderMonkey
url :
	 https://archive.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz
description :
	 JavaScript-C Engine
build_deps :
link_deps :
	 nspr
	 readline
optional_deps :
conflicts :
	 narwhal
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "js/src" do
	 inreplace "config/rules.mk",
	 "-install_name @executable_path/$(SHARED_LIBRARY) ",
	 "-install_name #{lib}/$(SHARED_LIBRARY) "
	 end
	 mkdir "brew-build" do
	 system "../js/src/configure", "--prefix=#{prefix}",
	 "--enable-readline",
	 "--enable-threadsafe",
	 "--with-system-nspr",
	 "--with-nspr-prefix=#{Formula["nspr"].opt_prefix}",
	 "--enable-macos-target=#{MacOS.version}"
	 inreplace "js-config", /JS_CONFIG_LIBS=.*?$/, "JS_CONFIG_LIBS=''"
	 system "make"
	 system "make", "install"
	 bin.install "shell/js"
	 end
