name :
	 Checkstyle
homepage :
	 https://checkstyle.sourceforge.io/
url :
	 https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.15/checkstyle-8.15-all.jar
description :
	 Check Java source against a coding standard
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
	 libexec.install "checkstyle-#{version}-all.jar"
	 bin.write_jar_script libexec/"checkstyle-#{version}-all.jar", "checkstyle"
