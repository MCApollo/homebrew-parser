name :
	 Crowdin
homepage :
	 https://support.crowdin.com/cli-tool/
url :
	 https://downloads.crowdin.com/cli/v2/crowdin-cli-2.0.25.zip
description :
	 Command-line tool that allows to manage your resources with crowdin.com
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
	 libexec.install "crowdin-cli.jar"
	 bin.write_jar_script libexec/"crowdin-cli.jar", "crowdin"
