name :
	 Pow
homepage :
	 http://pow.cx/
url :
	 http://get.pow.cx/versions/0.6.0.tar.gz
description :
	 Zero-config Rack server for local apps on macOS
build_deps :
link_deps :
	 node
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"pow").write <<~EOS
	 #!/bin/sh
	 export POW_BIN="#{bin}/pow"
	 exec "#{Formula["node"].opt_bin}/node" "#{libexec}/lib/command.js" "$@"
	 EOS
