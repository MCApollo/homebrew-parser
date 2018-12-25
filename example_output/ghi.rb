name :
	 Ghi
homepage :
	 https://github.com/stephencelis/ghi
url :
	 https://github.com/stephencelis/ghi/archive/1.2.0.tar.gz
description :
	 Work on GitHub issues on the command-line
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['multi_json', 'pygments.rb']
	 ['https://rubygems.org/gems/multi_json-1.12.1.gem', 'https://rubygems.org/gems/pygments.rb-1.1.2.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--install-dir", libexec
	 end
	 bin.install "ghi"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
	 man1.install "man/ghi.1"
