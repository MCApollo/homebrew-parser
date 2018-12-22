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
	 :java
conflicts :
patches :
EOF_patch :
install :
	 inreplace "config/linkerd.yaml", "disco", etc/"linkerd/disco"
	 libexec.install "linkerd-#{version}-exec"
	 bin.install_symlink libexec/"linkerd-#{version}-exec" => "linkerd"
	 pkgshare.install buildpath/"config/linkerd.yaml" => "default.yaml"
	 etc.install "config" => "linkerd"
	 etc.install "disco" => "linkerd/disco"
	 libexec.install_symlink etc/"linkerd" => "config"
	 libexec.install_symlink etc/"linkerd/disco" => "disco"
	 share.install "docs"
	 (var/"log/linkerd").mkpath
