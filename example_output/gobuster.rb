name :
	 Gobuster
homepage :
	 https://github.com/OJ/gobuster
url :
	 https://github.com/OJ/gobuster/archive/v2.0.1.tar.gz
description :
	 Directory/file & DNS busting tool written in Go
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/OJ").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/OJ/gobuster"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"gobuster"
