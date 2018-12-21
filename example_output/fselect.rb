name :
	 Fselect
homepage :
	 https://github.com/jhspetersson/fselect
url :
	 https://github.com/jhspetersson/fselect/archive/0.5.1.tar.gz
description :
	 Find files with SQL-like queries
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
