name :
	 Terraform
homepage :
	 https://www.terraform.io/
url :
	 https://github.com/hashicorp/terraform/archive/v0.11.11.tar.gz
description :
	 Tool to build, change, and version infrastructure
build_deps :
	 go
	 gox
link_deps :
conflicts :
	 tfenv
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 dir = buildpath/"src/github.com/hashicorp/terraform"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 ENV.delete "AWS_ACCESS_KEY"
	 ENV.delete "AWS_SECRET_KEY"
	 arch = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["XC_OS"] = "darwin"
	 ENV["XC_ARCH"] = arch
	 system "make", "tools", "test", "bin"
	 bin.install "pkg/darwin_#{arch}/terraform"
	 prefix.install_metafiles
	 end
