name :
	 DockerCredentialHelperEcr
homepage :
	 https://github.com/awslabs/amazon-ecr-credential-helper
url :
	 https://github.com/awslabs/amazon-ecr-credential-helper.git
description :
	 Docker Credential Helper for Amazon ECR
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/awslabs/amazon-ecr-credential-helper"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "make", "build"
	 bin.install "bin/local/docker-credential-ecr-login"
	 prefix.install_metafiles
	 end
