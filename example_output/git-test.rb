name :
	 GitTest
homepage :
	 https://github.com/spotify/git-test
url :
	 https://github.com/spotify/git-test/archive/v1.0.4.tar.gz
description :
	 Run tests on each distinct tree in a revision list
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "git-test"
	 man1.install "git-test.1"
	 pkgshare.install "test.sh"
