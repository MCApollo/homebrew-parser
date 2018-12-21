name :
	 Shellharden
homepage :
	 https://github.com/anordal/shellharden
url :
	 https://github.com/anordal/shellharden/archive/v4.1.tar.gz
description :
	 Bash syntax highlighter that encourages/fixes variables quoting
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
