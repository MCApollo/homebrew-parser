name :
	 Freediameter
homepage :
	 http://www.freediameter.net
url :
	 http://www.freediameter.net/hg/freeDiameter/archive/1.2.1.tar.gz
description :
	 Open source Diameter (Authentication) protocol implementation
build_deps :
	 cmake
link_deps :
	 gnutls
	 libgcrypt
	 libidn
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DDEFAULT_CONF_PATH=#{etc}",
	 "-DDISABLE_SCTP=ON"
	 system "make"
	 system "make", "install"
	 end
	 doc.install Dir["doc/*"]
	 pkgshare.install "contrib"
	 return if File.exist?(etc/"freeDiameter.conf")
	 cp doc/"freediameter.conf.sample", etc/"freeDiameter.conf"
	 end
	 def caveats; <<~EOS
	 To configure freeDiameter, edit #{etc}/freeDiameter.conf to taste.
	 Sample configuration files can be found in #{doc}.
	 For more information about freeDiameter configuration options, read:
	 http://www.freediameter.net/trac/wiki/Configuration
	 Other potentially useful files can be found in #{opt_pkgshare}/contrib.
	 EOS
