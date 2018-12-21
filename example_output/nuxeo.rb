name :
	 Nuxeo
homepage :
	 https://nuxeo.github.io/
url :
	 https://cdn.nuxeo.com/nuxeo-10.3/nuxeo-server-10.3-tomcat.zip
description :
	 Enterprise Content Management
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (var/"log/nuxeo").mkpath
	 (var/"lib/nuxeo/data").mkpath
	 (var/"run/nuxeo").mkpath
	 (var/"cache/nuxeo/packages").mkpath
	 libexec.install_symlink var/"cache/nuxeo/packages"
