name :
	 Piknik
homepage :
	 https://github.com/jedisct1/piknik
url :
	 https://github.com/jedisct1/piknik/archive/0.9.1.tar.gz
description :
	 Copy/paste anything over the network
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
	 dir = buildpath/"src/github.com/jedisct1/"
	 dir.install Dir["*"]
	 ln_s buildpath/"src", dir
	 cd dir do
	 system "glide", "install"
	 system "go", "build", "-o", bin/"piknik", "."
	 (prefix/"etc/profile.d").install "zsh.aliases" => "piknik.sh"
	 prefix.install_metafiles
