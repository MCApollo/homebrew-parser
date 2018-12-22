name :
	 HasteClient
homepage :
	 https://hastebin.com/
url :
	 https://rubygems.org/gems/faraday-0.12.2.gem
description :
	 CLI client for haste-server
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
	 "--install-dir", libexec
	 end
	 system "gem", "build", "haste.gemspec"
	 system "gem", "install", "--ignore-dependencies", "haste-#{version}.gem"
	 bin.install libexec/"bin/haste"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
