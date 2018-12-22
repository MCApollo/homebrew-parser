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
	 end
	 args << "sasl" if build.with? "sasl"
	 system "./build.sh", *args
	 end
	 mkdir "src/mongo-tools"
	 cp Dir["src/github.com/mongodb/mongo-tools/bin/*"], "src/mongo-tools/"
	 args = %W[
	 --prefix=#{prefix}
	 -j#{ENV.make_jobs}
	 --osx-version-min=#{MacOS.version}
	 ]
	 args << "CC=#{ENV.cc}"
	 args << "CXX=#{ENV.cxx}"
	 args << "--use-sasl-client" if build.with? "sasl"
	 args << "--use-system-boost" if build.with? "boost"
	 args << "--use-new-tools"
	 args << "--disable-warnings-as-errors" if MacOS.version >= :yosemite
	 if build.with? "openssl"
	 args << "--ssl"
	 args << "CCFLAGS=-I#{Formula["openssl"].opt_include}"
	 args << "LINKFLAGS=-L#{Formula["openssl"].opt_lib}"
	 end
	 scons "install", *args
	 (buildpath+"mongod.conf").write mongodb_conf
	 etc.install "mongod.conf"
	 (var+"mongodb").mkpath
	 (var+"log/mongodb").mkpath
