name :
	 Kontena
homepage :
	 https://kontena.io/
url :
description :
	 Command-line client for Kontena container orchestration platform
build_deps :
link_deps :
	 ruby
optional_deps :
conflicts :
resource :
	 ['equatable', 'excon', 'hash_validator', 'hitimes', 'kontena-websocket-client', 'liquid', 'necromancer', 'opto', 'pastel', 'retriable', 'ruby_dig', 'semantic', 'timers', 'tty-color', 'tty-cursor', 'tty-prompt', 'tty-reader', 'tty-screen', 'tty-table', 'unicode-display_width', 'unicode_utils', 'verse', 'websocket-driver', 'websocket-extensions', 'wisper']
	 ['https://rubygems.org/gems/equatable-0.5.0.gem', 'https://rubygems.org/gems/excon-0.60.0.gem', 'https://rubygems.org/gems/hash_validator-0.8.0.gem', 'https://rubygems.org/gems/hitimes-1.2.6.gem', 'https://rubygems.org/gems/kontena-websocket-client-0.1.1.gem', 'https://rubygems.org/gems/liquid-4.0.0.gem', 'https://rubygems.org/gems/necromancer-0.4.0.gem', 'https://rubygems.org/gems/opto-1.8.7.gem', 'https://rubygems.org/gems/pastel-0.7.2.gem', 'https://rubygems.org/gems/retriable-2.1.0.gem', 'https://rubygems.org/gems/ruby_dig-0.0.2.gem', 'https://rubygems.org/gems/semantic-1.6.1.gem', 'https://rubygems.org/gems/timers-4.1.2.gem', 'https://rubygems.org/gems/tty-color-0.4.2.gem', 'https://rubygems.org/gems/tty-cursor-0.5.0.gem', 'https://rubygems.org/gems/tty-prompt-0.14.0.gem', 'https://rubygems.org/gems/tty-reader-0.2.0.gem', 'https://rubygems.org/gems/tty-screen-0.6.4.gem', 'https://rubygems.org/gems/tty-table-0.9.0.gem', 'https://rubygems.org/gems/unicode-display_width-1.1.3.gem', 'https://rubygems.org/gems/unicode_utils-1.4.0.gem', 'https://rubygems.org/gems/verse-0.5.0.gem', 'https://rubygems.org/gems/websocket-driver-0.6.5.gem', 'https://rubygems.org/gems/websocket-extensions-0.1.3.gem', 'https://rubygems.org/gems/wisper-2.0.0.gem']
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
	 end
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
	 env = { :GEM_PATH => libexec, :KONTENA_EXTRA_BUILDTAGS => "homebrew" }
	 if build.head?
	 commit = Utils.popen_read("git", "rev-parse", "--short", "HEAD").chomp
	 env[:KONTENA_EXTRA_BUILDTAGS].concat ",head-#{commit}"
	 end
	 (bin/"kontena").write_env_script(libexec/"bin/kontena", env)
	 bash_completion.install "cli/lib/kontena/scripts/kontena.bash" => "kontena"
	 zsh_completion.install "cli/lib/kontena/scripts/kontena.zsh" => "_kontena"
