name :
	 Click
homepage :
	 https://github.com/databricks/click
url :
	 https://github.com/databricks/click/archive/v0.3.2.tar.gz
description :
	 The command-line interactive controller for Kubernetes
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
