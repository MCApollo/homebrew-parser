name :
	 Landscaper
homepage :
	 https://github.com/Eneco/landscaper
url :
	 https://github.com/Eneco/landscaper.git
description :
	 Manage the application landscape in a Kubernetes cluster
build_deps :
	 dep
	 go
link_deps :
	 kubernetes-cli
	 kubernetes-helm
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 arch = MacOS.prefer_64_bit? ? "amd64" : "x86"
	 ENV["TARGETS"] = "darwin/#{arch}"
	 dir = buildpath/"src/github.com/eneco/landscaper"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "make", "bootstrap"
	 system "make", "build"
	 bin.install "build/landscaper"
	 prefix.install_metafiles
	 end
