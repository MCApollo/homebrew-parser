name :
	 Jabba
homepage :
	 https://github.com/shyiko/jabba
url :
	 https://github.com/shyiko/jabba/archive/0.11.0.tar.gz
description :
	 Cross-platform Java Version Manager
build_deps :
	 glide
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 dir = buildpath/"src/github.com/shyiko/jabba"
	 dir.install buildpath.children
	 cd dir do
	 ldflags = "-X main.version=#{version}"
	 system "glide", "install"
	 system "go", "build", "-ldflags", ldflags, "-o", bin/"jabba"
	 prefix.install_metafiles
