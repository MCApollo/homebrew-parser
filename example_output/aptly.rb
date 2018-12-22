name :
	 Aptly
homepage :
	 https://www.aptly.info/
url :
	 https://github.com/aptly-dev/aptly/archive/v1.3.0.tar.gz
description :
	 Swiss army knife for Debian repository management
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = bin
	 (buildpath/"src/github.com/aptly-dev/aptly").install buildpath.children
	 cd "src/github.com/aptly-dev/aptly" do
	 system "make", "VERSION=#{version}", "install"
	 prefix.install_metafiles
	 bash_completion.install "completion.d/aptly"
	 zsh_completion.install "completion.d/_aptly"
	 end
