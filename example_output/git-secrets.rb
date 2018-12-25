name :
	 GitSecrets
homepage :
	 https://github.com/awslabs/git-secrets
url :
	 https://github.com/awslabs/git-secrets/archive/1.2.1.tar.gz
description :
	 Prevents you from committing sensitive information to a git repo
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
