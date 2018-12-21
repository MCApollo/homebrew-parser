name :
	 Scalastyle
homepage :
	 http://www.scalastyle.org/command-line.html
url :
	 https://oss.sonatype.org/content/repositories/releases/org/scalastyle/scalastyle_2.12/1.0.0/scalastyle_2.12-1.0.0-batch.jar
description :
	 Run scalastyle from the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "scalastyle_2.12-#{version}-batch.jar"
	 bin.write_jar_script("#{libexec}/scalastyle_2.12-#{version}-batch.jar", "scalastyle")
