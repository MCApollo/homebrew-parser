name :
	 Teleconsole
homepage :
	 https://www.teleconsole.com
url :
	 https://github.com/gravitational/teleconsole/archive/0.3.1.tar.gz
description :
	 Free service to share your terminal session with people you trust
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/gravitational/teleconsole/pull/8.patch?full_index=1
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/gravitational"
	 ln_s buildpath, buildpath/"src/github.com/gravitational/teleconsole"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "make", "OUT=#{bin}/teleconsole"
