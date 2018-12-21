name :
	 Travis
homepage :
	 https://github.com/travis-ci/travis.rb/
url :
	 https://github.com/travis-ci/travis.rb/archive/v1.8.9.tar.gz
description :
	 Command-line client for Travis CI
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
