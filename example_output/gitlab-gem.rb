name :
	 GitlabGem
homepage :
	 https://github.com/NARKOZ/gitlab
url :
	 https://github.com/NARKOZ/gitlab/archive/v4.7.0.tar.gz
description :
	 Ruby client and CLI for GitLab API
build_deps :
link_deps :
	 ruby
optional_deps :
conflicts :
resource :
	 ['httparty', 'terminal-table', 'multi_xml', 'unicode-display_width']
	 ['https://rubygems.org/gems/httparty-0.16.2.gem', 'https://rubygems.org/gems/terminal-table-1.8.0.gem', 'https://rubygems.org/gems/multi_xml-0.6.0.gem', 'https://rubygems.org/gems/unicode-display_width-1.4.0.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--ignore-dependencies",
	 "--no-document", "--install-dir", libexec
	 end
	 system "gem", "build", "gitlab.gemspec"
	 system "gem", "install", "--ignore-dependencies", "gitlab-#{version}.gem"
	 bin.install "exe/gitlab"
	 bin.env_script_all_files(libexec/"exe", :GEM_HOME => ENV["GEM_HOME"])
	 libexec.install Dir["*"]
