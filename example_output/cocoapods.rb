name :
	 Cocoapods
homepage :
	 https://cocoapods.org/
url :
	 https://github.com/CocoaPods/CocoaPods/archive/1.5.3.tar.gz
description :
	 Dependency manager for Cocoa projects
build_deps :
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 system "gem", "build", "cocoapods.gemspec"
	 system "gem", "install", "cocoapods-#{version}.gem"
	 bin.install libexec/"bin/pod", libexec/"bin/xcodeproj"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
