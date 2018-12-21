name :
	 ConsulTemplate
homepage :
	 https://github.com/hashicorp/consul-template
url :
	 https://github.com/hashicorp/consul-template.git
description :
	 Generic template rendering and notifications with Consul
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 arch = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["XC_OS"] = "darwin"
	 ENV["XC_ARCH"] = arch
	 dir = buildpath/"src/github.com/hashicorp/consul-template"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 project = "github.com/hashicorp/consul-template"
	 commit = Utils.popen_read("git rev-parse --short HEAD").chomp
	 ldflags = ["-X #{project}/version.Name=consul-template",
	 "-X #{project}/version.GitCommit=#{commit}"]
	 system "go", "build", "-o", bin/"consul-template", "-ldflags",
	 ldflags.join(" ")
	 prefix.install_metafiles
