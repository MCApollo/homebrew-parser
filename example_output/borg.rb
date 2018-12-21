name :
	 Borg
homepage :
	 https://github.com/ok-borg/borg
url :
	 https://github.com/ok-borg/borg/archive/v0.0.3.tar.gz
description :
	 Terminal based search engine for bash commands
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 Language::Go.stage_deps resources, buildpath/"src"
	 (buildpath/"src/github.com/ok-borg").mkpath
	 ln_s buildpath, buildpath/"src/github.com/ok-borg/borg"
	 system "go", "build", "-o", bin/"borg", "github.com/ok-borg/borg"
