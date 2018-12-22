name :
	 PaxRunner
homepage :
	 https://ops4j1.jira.com/
url :
	 https://search.maven.org/remotecontent?filepath=org/ops4j/pax/runner/pax-runner-assembly/1.8.6/pax-runner-assembly-1.8.6-jdk15.tar.gz
description :
	 Tool to provision OSGi bundles
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (bin+"pax-runner").write <<~EOS
	 #!/bin/sh
	 exec java $JAVA_OPTS -cp  #{libexec}/bin/pax-runner-#{version}.jar org.ops4j.pax.runner.Run "$@"
	 EOS
	 libexec.install Dir["*"]
