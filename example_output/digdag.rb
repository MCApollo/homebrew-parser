name :
	 Digdag
homepage :
	 https://www.digdag.io/
url :
	 https://dl.digdag.io/digdag-0.9.31.jar
description :
	 Workload Automation System
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "digdag-#{version}.jar" => "digdag.jar"
	 (bin/"digdag").write <<~EOS
	 #!/bin/bash
	 exec /bin/bash "#{libexec}/digdag.jar" "$@"
	 EOS
