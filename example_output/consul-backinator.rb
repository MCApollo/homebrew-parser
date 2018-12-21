name :
	 ConsulBackinator
homepage :
	 https://github.com/myENA/consul-backinator
url :
	 https://github.com/myENA/consul-backinator/archive/v1.6.5.tar.gz
description :
	 Consul backup and restoration application
build_deps :
	 glide
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 dir = buildpath/"src/github.com/myENA/consul-backinator"
	 dir.install buildpath.children
	 cd dir do
	 system "glide", "install"
	 system "go", "build", "-v", "-ldflags",
	 "-X main.appVersion=#{version}", "-o",
	 bin/"consul-backinator"
	 prefix.install_metafiles
