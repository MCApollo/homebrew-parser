name :
	 Gor
homepage :
	 https://gortool.com
url :
	 https://github.com/buger/goreplay.git
description :
	 Real-time HTTP traffic replay tool written in Go
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/buger/goreplay").install buildpath.children
	 cd "src/github.com/buger/goreplay" do
	 system "go", "build", "-o", bin/"gor", "-ldflags", "-X main.VERSION=#{version}"
	 prefix.install_metafiles
