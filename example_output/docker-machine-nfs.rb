name :
	 DockerMachineNfs
homepage :
	 https://github.com/adlogix/docker-machine-nfs
url :
	 https://github.com/adlogix/docker-machine-nfs/archive/0.5.2.tar.gz
description :
	 Activates NFS on docker-machine
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
	 bin.install "docker-machine-nfs.sh" => "docker-machine-nfs"
