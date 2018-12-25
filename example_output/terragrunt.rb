name :
	 Terragrunt
homepage :
	 https://github.com/gruntwork-io/terragrunt
url :
	 https://github.com/gruntwork-io/terragrunt/archive/v0.17.3.tar.gz
description :
	 Thin wrapper for Terraform e.g. for locking state
build_deps :
	 dep
	 go
link_deps :
	 terraform
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/gruntwork-io/terragrunt").install buildpath.children
	 cd "src/github.com/gruntwork-io/terragrunt" do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", bin/"terragrunt", "-ldflags", "-X main.VERSION=v#{version}"
	 end
