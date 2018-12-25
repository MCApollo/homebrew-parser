name :
	 Akamai
homepage :
	 https://github.com/akamai/cli
url :
	 https://github.com/akamai/cli/archive/1.1.0.tar.gz
description :
	 CLI toolkit for working with Akamai's APIs
build_deps :
	 dep
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
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 srcpath = buildpath/"src/github.com/akamai/cli"
	 srcpath.install buildpath.children
	 cd srcpath do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-tags", "noautoupgrade nofirstrun", "-o", bin/"akamai"
	 prefix.install_metafiles
	 end
