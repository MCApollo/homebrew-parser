name :
	 Wellington
homepage :
	 https://getwt.io/
url :
	 https://github.com/wellington/wellington/archive/v1.0.4.tar.gz
description :
	 Project-focused tool to manage Sass and spriting
build_deps :
	 go
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/wellington/wellington"
	 dir.install buildpath.children
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd dir do
	 system "go", "build", "-ldflags",
	 "-X github.com/wellington/wellington/version.Version=#{version}",
	 "-o", bin/"wt", "wt/main.go"
	 prefix.install_metafiles
	 end
