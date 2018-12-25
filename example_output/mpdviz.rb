name :
	 Mpdviz
homepage :
	 https://github.com/lucy/mpdviz
url :
	 https://github.com/lucy/mpdviz/archive/0.4.6.tar.gz
description :
	 Standalone console MPD visualizer
build_deps :
	 go
	 pkg-config
link_deps :
	 fftw
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", "mpdviz"
	 bin.install "mpdviz"
