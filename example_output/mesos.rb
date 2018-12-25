name :
	 Mesos
homepage :
	 https://mesos.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=mesos/1.6.1/mesos-1.6.1.tar.gz
description :
	 Apache cluster manager
build_deps :
	 maven
link_deps :
	 apr-util
	 :java
	 :macos
	 python@2
	 subversion
optional_deps :
conflicts :
	 nanopb-generator
resource :
	 ['protobuf', 'six', 'python-dateutil', 'pytz', 'python-gflags', 'google-apputils']
	 ['https://files.pythonhosted.org/packages/1b/90/f531329e628ff34aee79b0b9523196eb7b5b6b398f112bb0c03b24ab1973/protobuf-3.6.1.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz', 'https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz', 'https://files.pythonhosted.org/packages/df/ec/e31302d355bcb9d207d9b858adc1ecc4a6d8c855730c8ba4ddbdd3f8eb8d/python-gflags-3.1.2.tar.gz', 'https://files.pythonhosted.org/packages/69/66/a511c428fef8591c5adfa432a257a333e0d14184b6c5d03f1450827f7fe7/google-apputils-0.4.2.tar.gz']
patches :
EOF_patch :
install :
	 #
	 ENV.O0 unless DevelopmentTools.clang_build_version >= 900
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 ENV["ac_have_clock_syscall"] = "no"
	 end
	 native_patch = <<~EOS
	 import os
	 os.environ["CC"] = os.environ["CXX"]
	 os.environ["LDFLAGS"] = "@LIBS@"
	 \\0
	 EOS
	 inreplace "src/python/executor/setup.py.in",
	 "import ext_modules",
	 native_patch
	 inreplace "src/python/scheduler/setup.py.in",
	 "import ext_modules",
	 native_patch
	 maven_javadoc_patch = <<~EOS
	 <properties>
	 <maven.javadoc.skip>true</maven.javadoc.skip>
	 </properties>
	 \\0
	 EOS
	 inreplace "src/java/mesos.pom.in",
	 "<url>http://mesos.apache.org</url>",
	 maven_javadoc_patch
	 ENV.cxx11
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-svn=#{Formula["subversion"].opt_prefix}",
	 "--with-apr=#{Formula["apr"].opt_libexec}",
	 "--disable-python"
	 system "make"
	 system "make", "install"
	 ENV.append_to_cflags "-L#{Formula["subversion"].opt_lib}"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-svn=#{Formula["subversion"].opt_prefix}",
	 "--with-apr=#{Formula["apr"].opt_libexec}",
	 "--enable-python"
	 ["native", "interface", "executor", "scheduler", "cli", ""].each do |p|
	 cd "src/python/#{p}" do
	 system "python", *Language::Python.setup_install_args(prefix)
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"protobuf/lib/python2.7/site-packages"
	 %w[python-dateutil pytz python-gflags google-apputils].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"protobuf")
	 end
	 end
	 protobuf_path = libexec/"protobuf/lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", protobuf_path
	 %w[six protobuf].each do |r|
	 resource(r).stage do
	 if r == "protobuf"
	 ln_s buildpath/"protobuf/lib/python2.7/site-packages/google/apputils", "google/apputils"
	 end
	 system "python", *Language::Python.setup_install_args(libexec/"protobuf")
	 end
	 end
	 pth_contents = "import site; site.addsitedir('#{protobuf_path}')\n"
	 (lib/"python2.7/site-packages/homebrew-mesos-protobuf.pth").write pth_contents
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 sbin.env_script_all_files(libexec/"sbin", Language::Java.java_home_env("1.8"))
