name :
	 Plantuml
homepage :
	 https://plantuml.com/
url :
	 https://downloads.sourceforge.net/project/plantuml/1.2018.12/plantuml.1.2018.12.jar
description :
	 Draw UML diagrams
build_deps :
link_deps :
	 graphviz
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 jar = "plantuml.jar"
	 libexec.install "plantuml.#{version}.jar" => jar
	 (bin/"plantuml").write <<~EOS
	 #!/bin/bash
	 GRAPHVIZ_DOT="#{Formula["graphviz"].opt_bin}/dot" exec java -jar #{libexec}/#{jar} "$@"
	 EOS
	 chmod 0555, bin/"plantuml"
