name :
	 Daemontools
homepage :
	 https://cr.yp.to/daemontools.html
url :
	 https://cr.yp.to/daemontools/daemontools-0.76.tar.gz
description :
	 Collection of tools for managing UNIX services
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "daemontools-#{version}" do
	 system "package/compile"
	 bin.install Dir["command/*"]
	 end
