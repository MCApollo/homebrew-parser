name :
	 Warp
homepage :
	 https://github.com/spolu/warp
url :
	 https://github.com/spolu/warp/archive/v0.0.3.tar.gz
description :
	 Secure terminal sharing with one simple command
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
	 mkdir_p buildpath/"src/github.com/spolu/"
	 ln_sf buildpath, buildpath/"src/github.com/spolu/warp"
	 system "go", "build", "-o", "#{bin}/warp", "github.com/spolu/warp/client/cmd/warp"
