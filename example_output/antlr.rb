name :
	 Antlr
homepage :
	 https://www.antlr.org/
url :
	 https://www.antlr.org/download/antlr-4.7.1-complete.jar
description :
	 ANother Tool for Language Recognition
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
	 prefix.install "antlr-#{version}-complete.jar"
	 (bin/"antlr").write <<~EOS
	 #!/bin/bash
	 CLASSPATH="#{prefix}/antlr-#{version}-complete.jar:." exec java -jar #{prefix}/antlr-#{version}-complete.jar "$@"
	 EOS
	 (bin/"grun").write <<~EOS
	 #!/bin/bash
	 java -classpath #{prefix}/antlr-#{version}-complete.jar:. org.antlr.v4.gui.TestRig "$@"
	 EOS
