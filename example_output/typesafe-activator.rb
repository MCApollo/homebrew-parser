name :
	 TypesafeActivator
homepage :
	 https://www.lightbend.com/community/core-tools/activator-and-sbt
url :
	 https://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12-minimal.zip
description :
	 Tools for working with Lightbend Reactive Platform
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["bin/*.bat"]
	 libexec.install Dir["libexec/*"]
	 bin.install Dir["bin/*"]
	 chmod 0755, bin/"activator"
