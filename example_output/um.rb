name :
	 Um
homepage :
	 https://github.com/sinclairtarget/um
url :
	 https://github.com/sinclairtarget/um/archive/4.1.0.tar.gz
description :
	 Command-line utility for creating and maintaining personal man pages
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
	 system "gem", "build", "um.gemspec"
	 system "gem", "install", "--ignore-dependencies", "um-#{version}.gem"
	 bin.install libexec/"bin/um"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
	 bash_completion.install "um-completion.sh"
	 man1.install Dir["doc/man1/*"]
