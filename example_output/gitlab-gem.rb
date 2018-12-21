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
