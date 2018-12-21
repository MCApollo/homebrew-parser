name :
	 Scmpuff
homepage :
	 https://mroth.github.io/scmpuff/
url :
	 https://github.com/mroth/scmpuff/archive/v0.2.1.tar.gz
description :
	 Adds numbered shortcuts for common git commands
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir_p buildpath/"src/github.com/mroth"
	 ln_s buildpath, buildpath/"src/github.com/mroth/scmpuff"
	 ENV["GOPATH"] = buildpath
	 system "go", "build", "-o", "#{bin}/scmpuff", "-ldflags", "-X main.VERSION=#{version}", "./src/github.com/mroth/scmpuff"
