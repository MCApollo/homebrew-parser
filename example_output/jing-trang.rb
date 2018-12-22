name :
	 JingTrang
homepage :
	 http://www.thaiopensource.com/relaxng/
url :
	 https://github.com/relaxng/jing-trang/archive/V20151127.tar.gz
description :
	 Schema validation and conversion based on RELAX NG
build_deps :
	 ant
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "./ant", "jar"
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec/"build/jing.jar", "jing"
	 bin.write_jar_script libexec/"build/trang.jar", "trang"
