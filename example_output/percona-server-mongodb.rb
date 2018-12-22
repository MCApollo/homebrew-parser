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
	 (var/"mongodb").mkpath
	 (var/"log/mongodb").mkpath
