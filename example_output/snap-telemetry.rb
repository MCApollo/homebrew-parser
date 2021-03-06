name :
	 SnapTelemetry
homepage :
	 https://snap-telemetry.io/
url :
	 https://github.com/intelsdi-x/snap/archive/2.0.0.tar.gz
description :
	 Snap is an opensource telemetry framework
build_deps :
	 glide
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
	 ENV["CGO_ENABLED"] = "0"
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 snapteld = buildpath/"src/github.com/intelsdi-x/snap"
	 snapteld.install buildpath.children
	 cd snapteld do
	 system "glide", "install"
	 system "go", "build", "-o", "snapteld", "-ldflags", "-w -X main.gitversion=#{version}"
	 sbin.install "snapteld"
	 prefix.install_metafiles
	 end
	 snaptel = buildpath/"src/github.com/intelsdi-x/snap/cmd/snaptel"
	 cd snaptel do
	 system "go", "build", "-o", "snaptel", "-ldflags", "-w -X main.gitversion=#{version}"
	 bin.install "snaptel"
	 end
