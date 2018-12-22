name :
	 PaxConstruct
homepage :
	 https://ops4j1.jira.com/wiki/display/paxconstruct/Pax+Construct
url :
	 https://search.maven.org/remotecontent?filepath=org/ops4j/pax/construct/scripts/1.5/scripts-1.5.zip
description :
	 Tools to setup and develop OSGi projects quickly
build_deps :
link_deps :
	 maven
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 prefix.install_metafiles "bin"
	 libexec.install Dir["*"]
	 bin.write_exec_script Dir["#{libexec}/bin/*"].select { |f| File.executable? f }
