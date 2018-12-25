name :
	 Ktmpl
homepage :
	 https://github.com/InQuicker/ktmpl
url :
	 https://github.com/InQuicker/ktmpl/archive/0.7.0.tar.gz
description :
	 Parameterized templates for Kubernetes manifests
build_deps :
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
