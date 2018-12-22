name :
	 MongodbAT30
homepage :
	 https://www.mongodb.org/
url :
	 https://fastdl.mongodb.org/src/mongodb-src-r3.0.15.tar.gz
description :
	 High-performance document-oriented database
build_deps :
	 go
	 scons
link_deps :
	 :macos
	 boost
	 openssl
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
	 ENV["LIBRARY_PATH"] = "#{Formula["openssl"].opt_prefix}/lib"
	 ENV["CPATH"] = "#{Formula["openssl"].opt_prefix}/include"
	 end
	 system "./build.sh", *args
