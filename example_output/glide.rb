name :
	 Glide
homepage :
	 https://github.com/Masterminds/glide
url :
	 https://github.com/Masterminds/glide/archive/v0.13.2.tar.gz
description :
	 Simplified Go project management, dependency management, and vendoring
build_deps :
link_deps :
	 go
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 glidepath = buildpath/"src/github.com/Masterminds/glide"
	 glidepath.install buildpath.children
	 cd glidepath do
	 system "go", "build", "-o", "glide", "-ldflags", "-X main.version=#{version}"
	 bin.install "glide"
	 prefix.install_metafiles
