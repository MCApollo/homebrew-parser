name :
	 PicardTools
homepage :
	 https://broadinstitute.github.io/picard/
url :
	 https://github.com/broadinstitute/picard/releases/download/2.18.20/picard.jar
description :
	 Tools for manipulating HTS data and formats
build_deps :
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
	 libexec.install "picard.jar"
	 bin.write_jar_script libexec/"picard.jar", "picard"
