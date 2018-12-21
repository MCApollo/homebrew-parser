name :
	 MongodbAT32
homepage :
	 https://www.mongodb.org/
url :
	 https://fastdl.mongodb.org/src/mongodb-src-r3.2.21.tar.gz
description :
	 High-performance, schema-free, document-oriented database
build_deps :
	 go
	 scons
link_deps :
	 :macos
	 openssl
	 boost
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "src/github.com/mongodb/mongo-tools" do
	 args = %w[]
	 if build.with? "openssl"
	 args << "ssl"
	 ENV["LIBRARY_PATH"] = Formula["openssl"].opt_lib
	 ENV["CPATH"] = Formula["openssl"].opt_include
