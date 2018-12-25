name :
	 Braid
homepage :
	 https://cristibalan.github.io/braid/
url :
	 https://github.com/cristibalan/braid.git
description :
	 Simple tool to help track vendor branches in a Git repository
build_deps :
link_deps :
	 ruby
optional_deps :
conflicts :
resource :
	 ['arrayfields', 'chronic', 'json', 'fattr', 'main', 'map']
	 ['https://rubygems.org/gems/arrayfields-4.9.2.gem', 'https://rubygems.org/gems/chronic-0.10.2.gem', 'https://rubygems.org/gems/json-2.1.0.gem', 'https://rubygems.org/gems/fattr-2.3.0.gem', 'https://rubygems.org/gems/main-6.2.2.gem', 'https://rubygems.org/gems/map-6.6.0.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--ignore-dependencies",
	 "--no-document", "--install-dir", libexec
	 end
	 system "gem", "build", "braid.gemspec"
	 system "gem", "install", "--ignore-dependencies", "braid-#{version}.gem"
	 bin.install libexec/"bin/braid"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
