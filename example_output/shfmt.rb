name :
	 Shfmt
homepage :
	 https://github.com/mvdan/sh
url :
	 https://github.com/mvdan/sh/archive/v2.6.2.tar.gz
description :
	 Autoformat shell script source code
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/mvdan.cc").mkpath
	 ln_sf buildpath, buildpath/"src/mvdan.cc/sh"
	 system "go", "build", "-a", "-tags", "production brew", "-o", "#{bin}/shfmt", "mvdan.cc/sh/cmd/shfmt"
