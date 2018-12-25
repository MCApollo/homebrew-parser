name :
	 SpaceinvadersGo
homepage :
	 https://github.com/asib/spaceinvaders
url :
	 https://github.com/asib/spaceinvaders/archive/v1.2.tar.gz
description :
	 Space Invaders in your terminal written in Go
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
	 sipath = buildpath/"src/github.com/asib/spaceinvaders"
	 sipath.install Dir["{*,.git}"]
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "src/github.com/asib/spaceinvaders/" do
	 system "go", "build"
	 bin.install "spaceinvaders"
	 prefix.install_metafiles
	 end
