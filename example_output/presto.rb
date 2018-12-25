name :
	 Presto
homepage :
	 https://prestodb.io
url :
	 https://search.maven.org/remotecontent?filepath=com/facebook/presto/presto-server/0.215/presto-server-0.215.tar.gz
description :
	 Distributed SQL query engine for big data
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['presto-cli']
	 ['https://search.maven.org/remotecontent?filepath=com/facebook/presto/presto-cli/0.215/presto-cli-0.215-executable.jar']
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (libexec/"etc/node.properties").write <<~EOS
	 node.environment=production
	 node.id=ffffffff-ffff-ffff-ffff-ffffffffffff
	 node.data-dir=#{var}/presto/data
	 EOS
	 (libexec/"etc/jvm.config").write <<~EOS
	 -server
	 -Xmx16G
	 -XX:+UseG1GC
	 -XX:G1HeapRegionSize=32M
	 -XX:+UseGCOverheadLimit
	 -XX:+ExplicitGCInvokesConcurrent
	 -XX:+HeapDumpOnOutOfMemoryError
	 -XX:+ExitOnOutOfMemoryError
	 EOS
	 (libexec/"etc/config.properties").write <<~EOS
	 coordinator=true
	 node-scheduler.include-coordinator=true
	 http-server.http.port=8080
	 query.max-memory=5GB
	 query.max-memory-per-node=1GB
	 discovery-server.enabled=true
	 discovery.uri=http://localhost:8080
	 EOS
	 (libexec/"etc/log.properties").write "com.facebook.presto=INFO"
	 (libexec/"etc/catalog/jmx.properties").write "connector.name=jmx"
	 (bin/"presto-server").write <<~EOS
	 #!/bin/bash
	 exec "#{libexec}/bin/launcher" "$@"
	 EOS
	 resource("presto-cli").stage do
	 bin.install "presto-cli-#{version}-executable.jar" => "presto"
	 end
	 (var/"presto/data").mkpath
