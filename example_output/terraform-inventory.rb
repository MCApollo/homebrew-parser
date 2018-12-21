name :
	 TerraformInventory
homepage :
	 https://github.com/adammck/terraform-inventory
url :
	 https://github.com/adammck/terraform-inventory/archive/v0.6.1.tar.gz
description :
	 Terraform State → Ansible Dynamic Inventory
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/adammck/"
	 ln_sf buildpath, buildpath/"src/github.com/adammck/terraform-inventory"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"terraform-inventory", "-ldflags", "-X main.build_version='#{version}'"
