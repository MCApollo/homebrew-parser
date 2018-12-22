name :
	 Skinny
homepage :
	 http://skinny-framework.org/
url :
	 https://github.com/skinny-framework/skinny-framework/releases/download/3.0.1/skinny-3.0.1.tar.gz
description :
	 Full-stack web app framework in Scala
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"skinny").write <<~EOS
	 #!/bin/bash
	 export PATH=#{bin}:$PATH
	 PREFIX="#{libexec}" exec "#{libexec}/skinny" "$@"
	 EOS
