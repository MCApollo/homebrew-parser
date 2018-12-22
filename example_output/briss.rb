name :
	 Briss
homepage :
	 https://briss.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/briss/release%200.9/briss-0.9.tar.gz
description :
	 Crop PDF files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*.jar"]
	 bin.write_jar_script libexec/"briss-#{version}.jar", "briss"
