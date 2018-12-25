name :
	 Tokei
homepage :
	 https://github.com/Aaronepower/tokei
url :
	 https://github.com/Aaronepower/tokei/archive/v8.0.1.tar.gz
description :
	 Program that allows you to count code, quickly
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
	 system "cargo", "install", "--root", prefix, "--path", ".",
	 "--features", "all"
