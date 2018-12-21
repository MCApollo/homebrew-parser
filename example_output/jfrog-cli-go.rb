name :
	 JfrogCliGo
homepage :
	 https://github.com/jfrog/jfrog-cli-go
url :
	 https://github.com/jfrog/jfrog-cli-go/archive/v1.22.0.tar.gz
description :
	 Command-line interface for Jfrog Artifactory and Bintray
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GO111MODULE"] = "on"
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/jfrog/jfrog-cli-go").install Dir["*"]
	 cd "src/github.com/jfrog/jfrog-cli-go" do
	 system "go", "build", "-o", bin/"jfrog", "jfrog-cli/jfrog/main.go"
	 prefix.install_metafiles
