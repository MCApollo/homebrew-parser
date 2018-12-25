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
optional_deps :
conflicts :
resource :
	 ['colorize', 'commander', 'diffy', 'highline', 'string_undump', 'polyglot', 'treetop']
	 ['https://rubygems.org/gems/colorize-0.8.1.gem', 'https://rubygems.org/gems/commander-4.4.7.gem', 'https://rubygems.org/gems/diffy-3.2.1.gem', 'https://rubygems.org/gems/highline-2.0.0.gem', 'https://rubygems.org/gems/string_undump-0.1.1.gem', 'https://rubygems.org/gems/polyglot-0.3.5.gem', 'https://rubygems.org/gems/treetop-1.6.10.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--ignore-dependencies", "--install-dir", libexec
	 end
	 system "gem", "build", "terraform_landscape.gemspec"
	 system "gem", "install", "--ignore-dependencies", "terraform_landscape-#{version}.gem"
	 bin.install libexec/"bin/landscape"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
