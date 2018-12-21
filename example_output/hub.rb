name :
	 Hub
homepage :
	 https://hub.github.com/
url :
	 https://github.com/github/hub/archive/v2.6.1.tar.gz
description :
	 Add GitHub support to git on the command-line
build_deps :
	 go
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/github/hub").install buildpath.children
	 cd "src/github.com/github/hub" do
	 begin
	 deleted = ENV.delete "SDKROOT"
	 ENV["GEM_HOME"] = buildpath/"gem_home"
	 system "gem", "install", "bundler"
	 ENV.prepend_path "PATH", buildpath/"gem_home/bin"
	 system "make", "man-pages"
	 ensure
	 ENV["SDKROOT"] = deleted
