name :
	 TerraformDocs
homepage :
	 https://github.com/segmentio/terraform-docs
url :
	 https://github.com/segmentio/terraform-docs/archive/v0.5.0.tar.gz
description :
	 Tool to generate documentation from Terraform modules
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/segmentio/terraform-docs"
	 dir.install buildpath.children
	 cd dir do
	 system "make", "build-darwin-amd64"
	 bin.install "bin/darwin-amd64/terraform-docs"
	 prefix.install_metafiles
	 end
