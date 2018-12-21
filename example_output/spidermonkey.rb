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
conflicts :
	 narwhal
patches :
EOF_patch :
install :
	 cd "js/src" do
	 inreplace "config/rules.mk",
	 "-install_name @executable_path/$(SHARED_LIBRARY) ",
	 "-install_name #{lib}/$(SHARED_LIBRARY) "
