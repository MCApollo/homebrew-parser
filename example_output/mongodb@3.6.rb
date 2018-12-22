name :
	 MongodbAT36
homepage :
	 https://www.mongodb.org/
url :
	 https://fastdl.mongodb.org/src/mongodb-src-r3.6.9.tar.gz
description :
	 High-performance, schema-free, document-oriented database
build_deps :
	 go
	 pkg-config
	 scons
link_deps :
	 :xcode
	 :macos
	 python@2
	 openssl
	 boost
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 ENV.libcxx
	 ["Cheetah", "PyYAML", "typing"].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 end
	 end
	 (buildpath/".brew_home/Library/Python/2.7/lib/python/site-packages/vendor.pth").write <<~EOS
	 import site; site.addsitedir("#{buildpath}/vendor/lib/python2.7/site-packages")
	 EOS
	 cd "src/mongo/gotools" do
	 inreplace "build.sh" do |s|
	 s.gsub! "$(git describe)", version.to_s
	 s.gsub! "$(git rev-parse HEAD)", "homebrew"
	 end
	 args = %w[]
	 if build.with? "openssl"
	 args << "ssl"
	 ENV["LIBRARY_PATH"] = Formula["openssl"].opt_lib
	 ENV["CPATH"] = Formula["openssl"].opt_include
	 end
	 args << "sasl" if build.with? "sasl"
	 system "./build.sh", *args
	 end
	 (buildpath/"src/mongo-tools").install Dir["src/mongo/gotools/bin/*"]
	 args = %W[
	 --prefix=#{prefix}
	 -j#{ENV.make_jobs}
	 ]
	 args << "CC=#{ENV.cc}"
	 args << "CXX=#{ENV.cxx}"
	 args << "CCFLAGS=-mmacosx-version-min=#{MacOS.version}"
	 args << "LINKFLAGS=-mmacosx-version-min=#{MacOS.version}"
	 args << "--use-sasl-client" if build.with? "sasl"
	 args << "--use-system-boost" if build.with? "boost"
	 args << "--use-new-tools"
	 args << "--build-mongoreplay=true"
	 args << "--disable-warnings-as-errors" if MacOS.version >= :yosemite
	 if build.with? "openssl"
	 args << "--ssl"
	 args << "CCFLAGS=-I#{Formula["openssl"].opt_include}"
	 args << "LINKFLAGS=-L#{Formula["openssl"].opt_lib}"
	 end
	 scons "install", *args
	 (buildpath/"mongod.conf").write mongodb_conf
	 etc.install "mongod.conf"
	 (var/"mongodb").mkpath
	 (var/"log/mongodb").mkpath
