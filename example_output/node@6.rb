name :
	 NodeAT6
homepage :
	 https://nodejs.org/
url :
	 https://nodejs.org/dist/v6.14.4/node-v6.14.4.tar.xz
description :
	 Platform built on V8 to build network applications
build_deps :
	 pkg-config
	 python@2
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("icu4c").stage buildpath/"deps/icu"
	 system "./configure", "--prefix=#{prefix}", "--with-intl=full-icu"
	 system "make", "install"
	 (lib/"node_modules/npm/npmrc").atomic_write("prefix = #{HOMEBREW_PREFIX}\n")
