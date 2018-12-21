name :
	 Mdcat
homepage :
	 https://github.com/lunaryorn/mdcat
url :
	 https://github.com/lunaryorn/mdcat/archive/mdcat-0.11.0.tar.gz
description :
	 Show markdown documents on text terminals
build_deps :
	 cmake
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
