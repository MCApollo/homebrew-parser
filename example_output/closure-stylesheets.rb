name :
	 ClosureStylesheets
homepage :
	 https://github.com/google/closure-stylesheets
url :
	 https://github.com/google/closure-stylesheets/releases/download/v1.5.0/closure-stylesheets.jar
description :
	 Extended CSS preprocessor, linter, and internationalizer
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
	 libexec.install "closure-stylesheets.jar"
	 bin.write_jar_script libexec/"closure-stylesheets.jar", "closure-stylesheets"
