name :
	 Jetty
homepage :
	 https://www.eclipse.org/jetty/
url :
	 https://search.maven.org/remotecontent?filepath=org/eclipse/jetty/jetty-distribution/9.4.14.v20181114/jetty-distribution-9.4.14.v20181114.tar.gz
description :
	 Java servlet engine and webserver
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
	 libexec.install Dir["*"]
	 (libexec+"logs").mkpath
	 bin.mkpath
	 Dir.glob("#{libexec}/bin/*.sh") do |f|
	 scriptname = File.basename(f, ".sh")
	 (bin+scriptname).write <<~EOS
	 #!/bin/bash
	 JETTY_HOME=#{libexec}
	 #{f} "$@"
	 EOS
	 chmod 0755, bin+scriptname
	 end
