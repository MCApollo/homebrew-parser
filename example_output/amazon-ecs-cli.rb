name :
	 AmazonEcsCli
homepage :
	 https://aws.amazon.com/ecs
url :
	 https://github.com/aws/amazon-ecs-cli/archive/v1.12.1.tar.gz
description :
	 CLI for Amazon ECS to manage clusters and tasks for development
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/aws/amazon-ecs-cli").install buildpath.children
	 cd "src/github.com/aws/amazon-ecs-cli" do
	 system "make", "build"
	 bin.install "bin/local/ecs-cli"
	 prefix.install_metafiles
	 end
