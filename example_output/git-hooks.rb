name :
	 GitHooks
homepage :
	 https://github.com/icefox/git-hooks
url :
	 https://github.com/icefox/git-hooks/archive/1.00.0.tar.gz
description :
	 Manage project, user, and global Git hooks
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "git-hooks"
	 (etc/"git-hooks").install "contrib"
