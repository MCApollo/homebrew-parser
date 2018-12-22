name :
	 Terraforming
homepage :
	 https://terraforming.dtan4.net/
url :
	 https://github.com/dtan4/terraforming.git
description :
	 Export existing AWS resources to Terraform style (tf, tfstate)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--install-dir", libexec
	 end
	 system "gem", "build", "terraforming.gemspec"
	 system "gem", "install", "--ignore-dependencies",
	 "terraforming-#{version}.gem"
	 bin.install libexec/"bin/terraforming"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
