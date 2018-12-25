name :
	 DarkskyWeather
homepage :
	 https://github.com/genuinetools/weather
url :
	 https://github.com/genuinetools/weather/archive/v0.15.6.tar.gz
description :
	 Command-line weather from the darksky.net API
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
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/genuinetools/weather").install buildpath.children
	 cd "src/github.com/genuinetools/weather" do
	 project = "github.com/genuinetools/weather"
	 ldflags = ["-X #{project}/version.GITCOMMIT=homebrew",
	 "-X #{project}/version.VERSION=v#{version}"]
	 system "go", "build", "-o", bin/"weather", "-ldflags", ldflags.join(" ")
	 prefix.install_metafiles
	 end
