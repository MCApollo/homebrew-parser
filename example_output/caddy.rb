name :
	 Caddy
homepage :
	 https://caddyserver.com/
url :
	 https://github.com/mholt/caddy/archive/v0.11.1.tar.gz
description :
	 Alternative general-purpose HTTP/2 web server
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOOS"] = "darwin"
	 ENV["GOARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 (buildpath/"src/github.com/mholt").mkpath
	 ln_s buildpath, "src/github.com/mholt/caddy"
	 system "go", "build", "-ldflags",
	 "-X github.com/mholt/caddy/caddy/caddymain.gitTag=#{version}",
	 "-o", bin/"caddy", "github.com/mholt/caddy/caddy"
