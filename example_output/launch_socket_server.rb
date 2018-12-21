name :
	 LaunchSocketServer
homepage :
	 https://github.com/sstephenson/launch_socket_server
url :
	 https://github.com/sstephenson/launch_socket_server/archive/v1.0.0.tar.gz
description :
	 Bind to privileged ports without running a server as root
build_deps :
	 go
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
