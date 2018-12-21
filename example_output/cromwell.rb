name :
	 Cromwell
homepage :
	 https://github.com/broadinstitute/cromwell
url :
	 https://github.com/broadinstitute/cromwell/releases/download/36/cromwell-36.jar
description :
	 Workflow Execution Engine using Workflow Description Language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "sbt", "assembly"
	 libexec.install Dir["target/scala-*/cromwell-*.jar"][0]
	 libexec.install Dir["womtool/target/scala-2.12/womtool-*.jar"][0]
	 else
	 libexec.install Dir["cromwell-*.jar"][0]
	 resource("womtool").stage do
	 libexec.install Dir["womtool-*.jar"][0]
