name :
	 Galen
homepage :
	 http://galenframework.com/
url :
	 https://github.com/galenframework/galen/releases/download/galen-2.3.7/galen-bin-2.3.7.zip
description :
	 Automated testing of look and feel for responsive websites
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "galen.jar"
	 (bin/"galen").write <<~EOS
	 #!/bin/sh
	 set -e
	 java -cp "#{libexec}/galen.jar:lib/*:libs/*" com.galenframework.GalenMain "$@"
	 EOS
