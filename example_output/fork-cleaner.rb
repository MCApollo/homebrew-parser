name :
	 ForkCleaner
homepage :
	 https://github.com/caarlos0/fork-cleaner
url :
	 https://github.com/caarlos0/fork-cleaner/archive/v1.4.3.tar.gz
description :
	 Cleans up old and inactive forks on your GitHub account
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/caarlos0/fork-cleaner"
	 dir.install buildpath.children
	 cd dir do
	 system "dep", "ensure", "-vendor-only"
	 system "make"
	 bin.install "fork-cleaner"
	 prefix.install_metafiles
	 end
