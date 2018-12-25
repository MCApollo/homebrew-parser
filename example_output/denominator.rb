name :
	 Denominator
homepage :
	 https://github.com/Netflix/denominator/tree/v4.7.1/cli
url :
	 https://bintray.com/artifact/download/netflixoss/maven/com/netflix/denominator/denominator-cli/4.7.1/denominator-cli-4.7.1-fat.jar
description :
	 Portable Java library for manipulating DNS clouds
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
	 bin.install "denominator-cli-4.7.1-fat.jar" => "denominator"
