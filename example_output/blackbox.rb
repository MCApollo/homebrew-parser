name :
	 Blackbox
homepage :
	 https://github.com/StackExchange/blackbox
url :
	 https://github.com/StackExchange/blackbox/archive/v1.20180618.tar.gz
description :
	 Safely store secrets in Git/Mercurial/Subversion
build_deps :
link_deps :
	 gnupg
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["bin/*"]
	 bin.write_exec_script Dir[libexec/"*"].select { |f| File.executable? f }
