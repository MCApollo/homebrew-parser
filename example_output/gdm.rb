name :
	 Gdm
homepage :
	 https://github.com/sparrc/gdm
url :
	 https://github.com/sparrc/gdm/archive/1.4.tar.gz
description :
	 Go Dependency Manager (gdm)
build_deps :
link_deps :
	 go
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/sparrc"
	 ln_sf buildpath, buildpath/"src/github.com/sparrc/gdm"
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "src/github.com/sparrc/gdm" do
	 system "go", "build", "-o", bin/"gdm",
	 "-ldflags", "-X main.Version=#{version}"
	 end
