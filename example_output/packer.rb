name :
	 Packer
homepage :
	 https://packer.io
url :
	 https://github.com/hashicorp/packer.git
description :
	 Tool for creating identical machine images for multiple platforms
build_deps :
	 go
	 govendor
	 gox
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XC_OS"] = "darwin"
	 ENV["XC_ARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["GOPATH"] = buildpath
	 packerpath = buildpath/"src/github.com/hashicorp/packer"
	 packerpath.install Dir["{*,.git}"]
	 cd packerpath do
	 inreplace "Makefile" do |s|
	 s.gsub! "go get github.com/mitchellh/gox", ""
	 s.gsub! "go get golang.org/x/tools/cmd/stringer", ""
	 s.gsub! "go get github.com/kardianos/govendor", ""
	 end
	 (buildpath/"bin").mkpath
	 if build.head?
	 system "make", "bin"
	 else
	 system "make", "releasebin"
	 end
	 bin.install buildpath/"bin/packer"
	 zsh_completion.install "contrib/zsh-completion/_packer"
	 prefix.install_metafiles
	 end
