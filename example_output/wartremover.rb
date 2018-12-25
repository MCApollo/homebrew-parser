name :
	 Wartremover
homepage :
	 https://github.com/wartremover/wartremover
url :
	 https://github.com/wartremover/wartremover/archive/v2.3.7.tar.gz
description :
	 Flexible Scala code linting tool
build_deps :
	 sbt
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
	 system "./sbt", "-sbt-jar", Formula["sbt"].opt_libexec/"bin/sbt-launch.jar",
	 "core/assembly"
	 libexec.install "wartremover-assembly.jar"
	 bin.write_jar_script libexec/"wartremover-assembly.jar", "wartremover", :java_version => "1.8"
