name :
	 Byteman
homepage :
	 https://byteman.jboss.org/
url :
	 https://downloads.jboss.org/byteman/4.0.5/byteman-download-4.0.5-bin.zip
description :
	 Java bytecode manipulation tool for testing, monitoring and tracing
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 doc.install Dir["docs/*"], "README"
	 libexec.install ["bin", "lib", "contrib"]
	 pkgshare.install ["sample"]
	 env = Language::Java.java_home_env("1.6+").merge(:BYTEMAN_HOME => libexec)
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 target = bin/File.basename(file, File.extname(file))
	 target.write_env_script(libexec/"bin/#{File.basename(file)}", env)
	 end
