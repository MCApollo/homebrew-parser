name :
	 Deis
homepage :
	 https://deis.io/
url :
	 https://github.com/deis/workflow-cli/archive/v2.18.0.tar.gz
description :
	 The CLI for Deis Workflow
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
	 deispath = buildpath/"src/github.com/deis/workflow-cli"
	 deispath.install Dir["{*,.git}"]
	 cd deispath do
	 system "glide", "install"
	 system "go", "build", "-o", "build/deis",
	 "-ldflags",
	 "'-X=github.com/deis/workflow-cli/version.Version=v#{version}'"
	 bin.install "build/deis"
