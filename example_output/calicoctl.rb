name :
	 Calicoctl
homepage :
	 https://www.projectcalico.org
url :
	 https://github.com/projectcalico/calicoctl.git
description :
	 Calico CLI tool
build_deps :
	 glide
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 dir = buildpath/"src/github.com/projectcalico/calicoctl"
	 dir.install buildpath.children
	 cd dir do
	 system "glide", "install", "-strip-vendor"
	 system "make", "binary"
	 bin.install "dist/calicoctl-darwin-amd64" => "calicoctl"
	 prefix.install_metafiles
	 end
