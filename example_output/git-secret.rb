name :
	 GitSecret
homepage :
	 https://sobolevn.github.io/git-secret/
url :
description :
	 Bash-tool to store the private data inside a git repo
build_deps :
link_deps :
	 gawk
	 gnupg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "build"
	 system "bash", "utils/install.sh", prefix
