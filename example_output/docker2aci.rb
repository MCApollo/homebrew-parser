name :
	 Docker2aci
homepage :
	 https://github.com/appc/docker2aci
url :
	 https://github.com/appc/docker2aci/archive/v0.17.2.tar.gz
description :
	 Library and CLI tool to convert Docker images to ACIs
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/appc").mkpath
	 ln_s buildpath, buildpath/"src/github.com/appc/docker2aci"
	 system "go", "build", "-o", bin/"docker2aci", "-ldflags",
	 "-X github.com/appc/docker2aci/lib.Version=#{version}",
	 "github.com/appc/docker2aci"
