name :
	 AwsOkta
homepage :
	 https://github.com/segmentio/aws-okta
url :
	 https://github.com/segmentio/aws-okta/archive/v0.19.4.tar.gz
description :
	 Authenticate with AWS using your Okta credentials
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/segmentio/aws-okta").install buildpath.children
	 cd "src/github.com/segmentio/aws-okta" do
	 system "go", "build", "-ldflags", "-X main.Version=#{version}"
	 bin.install "aws-okta"
	 prefix.install_metafiles
