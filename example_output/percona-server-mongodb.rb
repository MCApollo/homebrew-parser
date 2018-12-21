name :
	 PerconaServerMongodb
homepage :
	 https://www.percona.com
url :
	 https://www.percona.com/downloads/percona-server-mongodb-3.6/percona-server-mongodb-3.6.6-1.4/source/tarball/percona-server-mongodb-3.6.6-1.4.tar.gz
description :
	 Drop-in MongoDB replacement
build_deps :
	 go
	 pkg-config
	 scons
link_deps :
	 :macos
	 openssl
	 boost
conflicts :
	 mongodb
patches :
EOF_patch :
install :
	 ["Cheetah", "PyYAML", "typing"].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 (var/"mongodb").mkpath
	 (var/"log/mongodb").mkpath
