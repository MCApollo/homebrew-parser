name :
	 Rhino
homepage :
	 https://www.mozilla.org/rhino/
url :
	 https://github.com/mozilla/rhino/releases/download/Rhino1_7_9_Release/rhino-1.7.9.zip
description :
	 JavaScript engine
build_deps :
link_deps :
optional_deps :
conflicts :
	 nut
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rhino_jar = "rhino-#{version}.jar"
	 libexec.install "lib/#{rhino_jar}"
	 bin.write_jar_script libexec/rhino_jar, "rhino"
	 doc.install Dir["docs/*"]
