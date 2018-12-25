name :
	 Wego
homepage :
	 https://github.com/schachmat/wego
url :
	 https://github.com/schachmat/wego/archive/2.0.tar.gz
description :
	 Weather app for the terminal
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
	 (buildpath/"src/github.com/schachmat").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/schachmat/wego"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"wego"
