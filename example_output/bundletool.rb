name :
	 Bundletool
homepage :
	 https://github.com/google/bundletool
url :
	 https://github.com/google/bundletool/releases/download/0.7.2/bundletool-all-0.7.2.jar
description :
	 Command-line tool to manipulate Android App Bundles
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['bundle']
	 ['https://gist.githubusercontent.com/raw/ca85ede7ac072a44f48c658be55ff0d3/sample.aab']
patches :
EOF_patch :
install :
	 libexec.install "bundletool-all-#{version}.jar"
	 bin.write_jar_script libexec/"bundletool-all-#{version}.jar", "bundletool"
