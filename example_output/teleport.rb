name :
	 Teleport
homepage :
	 https://gravitational.com/teleport
url :
	 https://github.com/gravitational/teleport/archive/v3.0.1.tar.gz
description :
	 Modern SSH server for teams managing distributed infrastructure
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
	 etsh
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOOS"] = "darwin"
	 ENV["GOARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["GOPATH"] = buildpath
	 ENV["GOROOT"] = Formula["go"].opt_libexec
	 (buildpath/"src/github.com/gravitational/teleport").install buildpath.children
	 cd "src/github.com/gravitational/teleport" do
	 ENV.deparallelize { system "make", "full" }
	 bin.install Dir["build/*"]
	 prefix.install_metafiles
	 end
