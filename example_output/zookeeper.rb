name :
	 Zookeeper
homepage :
	 https://zookeeper.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
description :
	 Centralized server for distributed coordination of services
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if Hardware::CPU.is_32_bit?
	 ENV["ARCHFLAGS"] = "-arch #{Hardware::CPU.arch_32_bit}"
	 else
	 ENV["ARCHFLAGS"] = Hardware::CPU.universal_archs.as_arch_flags
	 end
	 if build.head?
	 system "ant", "compile_jute"
	 system "autoreconf", "-fvi", "src/c"
	 end
	 cd "src/c" do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-cppunit"
	 system "make", "install"
	 end
	 rm_f Dir["bin/*.cmd"]
	 if build.head?
	 system "ant"
	 libexec.install "bin", "src/contrib", "src/java/lib"
	 libexec.install Dir["build/*.jar"]
	 else
	 libexec.install "bin", "contrib", "lib"
	 libexec.install Dir["*.jar"]
	 end
	 bin.mkpath
	 (etc/"zookeeper").mkpath
	 (var/"log/zookeeper").mkpath
	 (var/"run/zookeeper/data").mkpath
	 Pathname.glob("#{libexec}/bin/*.sh") do |path|
	 next if path == libexec+"bin/zkEnv.sh"
	 script_name = path.basename
	 bin_name    = path.basename ".sh"
	 (bin+bin_name).write shim_script(script_name)
	 end
	 defaults = etc/"zookeeper/defaults"
	 defaults.write(default_zk_env) unless defaults.exist?
	 log4j_properties = etc/"zookeeper/log4j.properties"
	 log4j_properties.write(default_log4j_properties) unless log4j_properties.exist?
	 inreplace "conf/zoo_sample.cfg",
	 /^dataDir=.*/, "dataDir=#{var}/run/zookeeper/data"
	 cp "conf/zoo_sample.cfg", "conf/zoo.cfg"
	 (etc/"zookeeper").install ["conf/zoo.cfg", "conf/zoo_sample.cfg"]
