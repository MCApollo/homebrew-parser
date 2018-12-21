name :
	 Wskdeploy
homepage :
	 https://openwhisk.apache.org/
url :
	 https://github.com/apache/incubator-openwhisk-wskdeploy/archive/0.9.9.tar.gz
description :
	 Apache OpenWhisk project deployment utility
build_deps :
	 go
	 godep
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/apache/incubator-openwhisk-wskdeploy").install buildpath.children
	 cd "src/github.com/apache/incubator-openwhisk-wskdeploy" do
	 system "godep", "restore"
	 system "go", "build", "-o", bin/"wskdeploy",
	 "-ldflags", "-X main.Version=#{version}"
	 prefix.install_metafiles
