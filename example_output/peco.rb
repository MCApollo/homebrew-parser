name :
	 Peco
homepage :
	 https://github.com/peco/peco
url :
	 https://github.com/peco/peco/archive/v0.5.3.tar.gz
description :
	 Simplistic interactive filtering tool
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
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 (buildpath/"src/github.com/peco/peco").install buildpath.children
	 cd "src/github.com/peco/peco" do
	 system "glide", "install"
	 system "go", "build", "-o", bin/"peco", "cmd/peco/peco.go"
	 prefix.install_metafiles
	 end
