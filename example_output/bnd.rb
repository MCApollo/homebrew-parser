name :
	 Bnd
homepage :
	 https://bnd.bndtools.org/
url :
	 https://search.maven.org/remotecontent?filepath=biz/aQute/bnd/biz.aQute.bnd/4.1.0/biz.aQute.bnd-4.1.0.jar
description :
	 The Swiss Army Knife for OSGi bundles
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "biz.aQute.bnd-#{version}.jar"
	 bin.write_jar_script libexec/"biz.aQute.bnd-#{version}.jar", "bnd"
