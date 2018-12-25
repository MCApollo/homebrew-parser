name :
	 Lolcat
homepage :
	 https://github.com/busyloop/lolcat
url :
	 https://github.com/busyloop/lolcat.git
description :
	 Rainbows and unicorns in your console!
build_deps :
link_deps :
	 ruby
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 system "gem", "build", "lolcat.gemspec"
	 system "gem", "install", "lolcat-#{version}.gem"
	 bin.install libexec/"bin/lolcat"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
