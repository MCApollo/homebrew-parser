name :
	 Opa
homepage :
	 https://www.openpolicyagent.org
url :
	 https://github.com/open-policy-agent/opa/archive/v0.10.2.tar.gz
description :
	 Open source, general-purpose policy engine
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/open-policy-agent/opa").install buildpath.children
	 cd "src/github.com/open-policy-agent/opa" do
	 system "go", "build", "-o", bin/"opa", "-installsuffix", "static",
	 "-ldflags",
	 "-X github.com/open-policy-agent/opa/version.Version=#{version}"
	 prefix.install_metafiles
	 end
