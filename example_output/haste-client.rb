name :
	 HasteClient
homepage :
	 https://hastebin.com/
url :
description :
	 CLI client for haste-server
build_deps :
link_deps :
	 ruby
optional_deps :
conflicts :
resource :
	 ['faraday', 'json', 'multipart-post']
	 ['https://rubygems.org/gems/faraday-0.12.2.gem', 'https://rubygems.org/gems/json-2.1.0.gem', 'https://rubygems.org/gems/multipart-post-2.0.0.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--install-dir", libexec
	 end
	 system "gem", "build", "haste.gemspec"
	 system "gem", "install", "--ignore-dependencies", "haste-#{version}.gem"
	 bin.install libexec/"bin/haste"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
