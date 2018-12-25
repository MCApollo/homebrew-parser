name :
	 Vnu
homepage :
	 https://validator.github.io/validator/
url :
	 https://github.com/validator/validator/releases/download/18.11.5/vnu.jar_18.11.5.zip
description :
	 Nu Markup Checker: command-line and server HTML validator
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
	 libexec.install "vnu.jar"
	 bin.write_jar_script libexec/"vnu.jar", "vnu"
