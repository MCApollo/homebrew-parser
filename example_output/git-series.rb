name :
	 GitSeries
homepage :
	 https://github.com/git-series/git-series
url :
	 https://github.com/git-series/git-series/archive/0.9.1.tar.gz
description :
	 Track changes to a patch series over time
build_deps :
	 cmake
	 rust
link_deps :
	 libssh2
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
	 man1.install "git-series.1"
