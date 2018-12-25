name :
	 Up
homepage :
	 https://github.com/akavel/up
url :
	 https://github.com/akavel/up/archive/v0.3.2.tar.gz
description :
	 Tool for writing command-line pipes with instant live preview
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
	 dir = buildpath/"src/github.com/akavel/up"
	 dir.install buildpath.children
	 cd dir do
	 system "go", "build", "-o", bin/"up", "up.go"
	 prefix.install_metafiles
	 end
