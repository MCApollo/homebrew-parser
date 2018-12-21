name :
	 Llnode
homepage :
	 https://github.com/nodejs/llnode
url :
	 https://github.com/nodejs/llnode/archive/v2.0.0.tar.gz
description :
	 LLDB plugin for live/post-mortem debugging of node.js apps
build_deps :
	 node
	 python@2
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_path "PATH", "#{Formula["node"].libexec}/lib/node_modules/npm/node_modules/node-gyp/bin"
	 inreplace "Makefile", "node-gyp", "node-gyp.js"
	 target = if DevelopmentTools.clang_build_version >= 900
	 "lldb-3.9"
	 elsif DevelopmentTools.clang_build_version >= 802
	 "lldb-3.8"
	 else
	 "lldb-3.4"
