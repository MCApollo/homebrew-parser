name :
	 Calabash
homepage :
	 https://xmlcalabash.com/
url :
	 https://github.com/ndw/xmlcalabash1/releases/download/1.1.22-98/xmlcalabash-1.1.22-98.zip
description :
	 XProc (XML Pipeline Language) implementation
build_deps :
link_deps :
	 saxon
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec/"xmlcalabash-#{version}.jar", "calabash", "-Xmx1024m"
