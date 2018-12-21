name :
	 Mongodb
homepage :
	 https://www.mongodb.com/
url :
	 https://fastdl.mongodb.org/src/mongodb-src-r4.0.4.tar.gz
description :
	 High-performance, schema-free, document-oriented database
build_deps :
	 go
	 pkg-config
	 scons
link_deps :
	 :xcode
	 :macos
	 openssl
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 ENV.libcxx
	 ["Cheetah", "PyYAML", "typing"].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 (var/"mongodb").mkpath
	 (var/"log/mongodb").mkpath
