name :
	 Linkerd
homepage :
	 https://linkerd.io/
url :
	 https://github.com/linkerd/linkerd/releases/download/1.5.2/linkerd-1.5.2.tgz
description :
	 Drop-in RPC proxy designed for microservices
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (var/"log/linkerd").mkpath
