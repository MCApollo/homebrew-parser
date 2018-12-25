name :
	 Languagetool
homepage :
	 https://www.languagetool.org/
url :
	 https://languagetool.org/download/LanguageTool-4.3.zip
description :
	 Style and grammar checker
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
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec/"languagetool-commandline.jar", "languagetool"
	 (bin+"languagetool-server").write server_script(libexec/"languagetool-server.jar")
	 bin.write_jar_script libexec/"languagetool.jar", "languagetool-gui"
