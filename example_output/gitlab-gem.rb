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
conflicts :
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
