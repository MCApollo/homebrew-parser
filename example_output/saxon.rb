name :
	 Saxon
homepage :
	 https://saxon.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/saxon/Saxon-HE/9.9/SaxonHE9-9-0-1J.zip
description :
	 XSLT and XQuery processor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*.jar", "doc", "notices"]
	 bin.write_jar_script libexec/"saxon9he.jar", "saxon"
