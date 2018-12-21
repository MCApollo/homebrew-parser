name :
	 FaasCli
homepage :
	 https://docs.get-faas.com/
url :
	 https://github.com/openfaas/faas-cli.git
description :
	 CLI for templating and/or deploying FaaS functions
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XC_OS"] = "darwin"
	 ENV["XC_ARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/openfaas/faas-cli").install buildpath.children
	 cd "src/github.com/openfaas/faas-cli" do
	 project = "github.com/openfaas/faas-cli"
	 commit = Utils.popen_read("git", "rev-parse", "HEAD").chomp
	 system "go", "build", "-ldflags",
	 "-s -w -X #{project}/version.GitCommit=#{commit} -X #{project}/version.Version=#{version}", "-a",
	 "-installsuffix", "cgo", "-o", bin/"faas-cli"
	 bin.install_symlink "faas-cli" => "faas"
	 prefix.install_metafiles
