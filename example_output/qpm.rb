name :
	 Qpm
homepage :
	 https://www.qpm.io
url :
	 https://github.com/Cutehacks/qpm.git
description :
	 Package manager for Qt applications
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src").mkpath
	 ln_s buildpath, "src/qpm.io"
	 system "go", "build", "-o", "bin/qpm", "qpm.io/qpm"
	 bin.install "bin/qpm"
