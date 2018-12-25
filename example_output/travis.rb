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
optional_deps :
conflicts :
resource :
	 ['addressable', 'backports', 'ethon', 'faraday', 'faraday_middleware', 'ffi', 'gh', 'highline', 'json', 'launchy', 'multi_json', 'multipart-post', 'net-http-persistent', 'net-http-pipeline', 'pusher-client', 'typhoeus', 'websocket']
	 ['https://rubygems.org/gems/addressable-2.4.0.gem', 'https://rubygems.org/gems/backports-3.11.3.gem', 'https://rubygems.org/gems/ethon-0.11.0.gem', 'https://rubygems.org/gems/faraday-0.15.2.gem', 'https://rubygems.org/gems/faraday_middleware-0.12.2.gem', 'https://rubygems.org/gems/ffi-1.9.25.gem', 'https://rubygems.org/gems/gh-0.15.1.gem', 'https://rubygems.org/gems/highline-1.7.10.gem', 'https://rubygems.org/gems/json-2.1.0.gem', 'https://rubygems.org/gems/launchy-2.4.3.gem', 'https://rubygems.org/gems/multi_json-1.13.1.gem', 'https://rubygems.org/gems/multipart-post-2.0.0.gem', 'https://rubygems.org/gems/net-http-persistent-2.9.4.gem', 'https://rubygems.org/gems/net-http-pipeline-1.0.1.gem', 'https://rubygems.org/gems/pusher-client-0.6.2.gem', 'https://rubygems.org/gems/typhoeus-0.8.0.gem', 'https://rubygems.org/gems/websocket-1.2.8.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--ignore-dependencies",
	 "--no-document", "--install-dir", libexec
	 end
	 system "gem", "build", "travis.gemspec"
	 system "gem", "install", "--ignore-dependencies", "travis-#{version}.gem"
	 bin.install libexec/"bin/travis"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
