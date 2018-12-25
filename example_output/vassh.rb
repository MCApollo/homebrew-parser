name :
	 Vassh
homepage :
	 https://github.com/x-team/vassh
url :
	 https://github.com/x-team/vassh/archive/0.2.tar.gz
description :
	 Vagrant Host-Guest SSH Command Wrapper/Proxy/Forwarder
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
	 bin.install "vassh.sh", "vasshin", "vassh"
