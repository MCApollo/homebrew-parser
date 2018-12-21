name :
	 ScmManager
homepage :
	 https://www.scm-manager.org
url :
	 https://maven.scm-manager.org/nexus/content/repositories/releases/sonia/scm/scm-server/1.59/scm-server-1.59-app.tar.gz
description :
	 Manage Git, Mercurial, and Subversion repos over HTTP
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 (bin/"scm-server").write <<~EOS
	 #!/bin/bash
	 BASEDIR="#{libexec}"
	 REPO="#{libexec}/lib"
	 export JAVA_HOME=$(#{Language::Java.java_home_cmd("1.8")})
	 "#{libexec}/bin/scm-server" "$@"
	 EOS
	 chmod 0755, bin/"scm-server"
	 tools = libexec/"tools"
	 tools.install resource("client")
	 scm_cli_client = bin/"scm-cli-client"
	 scm_cli_client.write <<~EOS
	 #!/bin/bash
	 export JAVA_HOME=$(#{Language::Java.java_home_cmd("1.8")})
	 java -jar "#{tools}/scm-cli-client-#{version}-jar-with-dependencies.jar" "$@"
	 EOS
	 chmod 0755, scm_cli_client
