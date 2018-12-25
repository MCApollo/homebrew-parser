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
optional_deps :
	 boost
conflicts :
	 mongodb
resource :
	 ['Cheetah', 'PyYAML', 'typing']
	 ['https://files.pythonhosted.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/ec/cc/28444132a25c113149cec54618abc909596f0b272a74c55bab9593f8876c/typing-3.6.4.tar.gz']
patches :
EOF_patch :
install :
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
	 s.gsub! "$(git describe)", version.to_s.split("-")[0]
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
	 (buildpath/"mongod.conf").write <<~EOS
	 systemLog:
	 destination: file
	 path: #{var}/log/mongodb/mongo.log
	 logAppend: true
	 storage:
	 dbPath: #{var}/mongodb
	 net:
	 bindIp: 127.0.0.1
	 EOS
	 etc.install "mongod.conf"
	 (var/"mongodb").mkpath
	 (var/"log/mongodb").mkpath
