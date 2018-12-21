name :
	 TerraformLandscape
homepage :
	 https://github.com/coinbase/terraform-landscape
url :
	 https://github.com/coinbase/terraform-landscape/archive/v0.2.2.tar.gz
description :
	 Improve Terraform's plan output
build_deps :
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--ignore-dependencies", "--install-dir", libexec
