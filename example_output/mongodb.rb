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
optional_deps :
conflicts :
resource :
	 ['Cheetah', 'PyYAML', 'typing']
	 ['https://files.pythonhosted.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/bf/9b/2bf84e841575b633d8d91ad923e198a415e3901f228715524689495b4317/typing-3.6.6.tar.gz']
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
	 ENV["CPATH"] = Formula["openssl"].opt_include
	 ENV["LIBRARY_PATH"] = Formula["openssl"].opt_lib
	 system "./build.sh", "ssl"
	 end
	 (buildpath/"src/mongo-tools").install Dir["src/mongo/gotools/bin/*"]
	 args = %W[
	 --prefix=#{prefix}
	 -j#{ENV.make_jobs}
	 CC=#{ENV.cc}
	 CXX=#{ENV.cxx}
	 CCFLAGS=-mmacosx-version-min=#{MacOS.version}
	 LINKFLAGS=-mmacosx-version-min=#{MacOS.version}
	 --build-mongoreplay=true
	 --disable-warnings-as-errors
	 --use-new-tools
	 --ssl
	 CCFLAGS=-I#{Formula["openssl"].opt_include}
	 LINKFLAGS=-L#{Formula["openssl"].opt_lib}
	 ]
	 scons "install", *args
	 (buildpath/"mongod.conf").write mongodb_conf
	 etc.install "mongod.conf"
	 (var/"mongodb").mkpath
	 (var/"log/mongodb").mkpath
