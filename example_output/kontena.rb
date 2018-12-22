name :
	 Kontena
homepage :
	 https://kontena.io/
url :
	 https://rubygems.org/gems/equatable-0.5.0.gem
description :
	 Command-line client for Kontena container orchestration platform
build_deps :
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 cd "cli" do
	 system "gem", "build", "--norc", "kontena-cli.gemspec"
	 if build.head?
	 system "gem", "install", Dir["kontena-cli-*.gem"].first,
	 "--no-document", "--norc", "--install-dir", libexec
	 else
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--ignore-dependencies",
	 "--no-document", "--norc", "--install-dir", libexec
	 end
	 system "gem", "install", "--ignore-dependencies", "--norc",
	 "--no-document", "kontena-cli-#{version}.gem"
	 end
