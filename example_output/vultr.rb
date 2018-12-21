name :
	 Vultr
homepage :
	 https://jamesclonk.github.io/vultr
url :
	 https://github.com/JamesClonk/vultr/archive/1.15.0.tar.gz
description :
	 Command-line tool for Vultr
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/JamesClonk").mkpath
	 ln_s buildpath, buildpath/"src/github.com/JamesClonk/vultr"
	 system "go", "build", "-o", bin/"vultr"
