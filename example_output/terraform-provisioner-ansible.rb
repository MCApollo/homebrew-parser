name :
	 TerraformProvisionerAnsible
homepage :
	 https://github.com/jonmorehouse/terraform-provisioner-ansible
url :
	 https://github.com/jonmorehouse/terraform-provisioner-ansible/archive/0.0.2.tar.gz
description :
	 Ansible provisioner for Terraform
build_deps :
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
	 terrapath = buildpath/"src/github.com/jonmorehouse/terraform-provisioner-ansible"
	 terrapath.install Dir["*"]
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd terrapath do
	 system "go", "build"
	 bin.install "terraform-provisioner-ansible"
	 prefix.install_metafiles
	 end
