name :
	 GitOctopus
homepage :
	 https://github.com/lesfurets/git-octopus
url :
	 https://github.com/lesfurets/git-octopus/archive/v1.4.tar.gz
description :
	 The continuous merge workflow
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "build"
	 bin.install "bin/git-octopus", "bin/git-conflict", "bin/git-apply-conflict-resolution"
	 man1.install "doc/git-octopus.1", "doc/git-conflict.1"
