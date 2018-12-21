name :
	 NodeAT8
homepage :
	 https://nodejs.org/
url :
	 https://nodejs.org/dist/v8.14.0/node-v8.14.0.tar.xz
description :
	 Platform built on V8 to build network applications
build_deps :
	 pkg-config
	 python@2
link_deps :
	 icu4c
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-intl=system-icu"
	 system "make", "install"
	 (lib/"node_modules/npm/npmrc").atomic_write("prefix = #{HOMEBREW_PREFIX}\n")
