name :
	 Jid
homepage :
	 https://github.com/simeji/jid
url :
	 https://github.com/simeji/jid/archive/0.7.2.tar.gz
description :
	 Json incremental digger
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
	 (buildpath/"src/github.com/simeji").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/simeji/jid"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"jid", "cmd/jid/jid.go"
