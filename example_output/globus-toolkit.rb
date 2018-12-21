name :
	 GlobusToolkit
homepage :
	 https://www.globus.org/toolkit/
url :
	 https://downloads.globus.org/toolkit/gt6/stable/installers/src/globus_toolkit-6.0.1531931206.tar.gz
description :
	 Toolkit used for building grids
build_deps :
	 pkg-config
link_deps :
	 libtool
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 man.mkpath
	 system "./configure", "--prefix=#{libexec}",
	 "--mandir=#{man}",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"
	 bins = Dir["#{libexec}/bin/*"].select { |f| File.executable? f }
	 bin.write_exec_script bins
