name :
	 Druid
homepage :
	 http://druid.io
url :
	 http://static.druid.io/artifacts/releases/druid-0.12.2-bin.tar.gz
description :
	 High-performance, column-oriented, distributed data store
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 %w[
	 broker.sh
	 coordinator.sh
	 historical.sh
	 middleManager.sh
	 overlord.sh
	 ].each do |sh|
	 inreplace libexec/"bin/#{sh}", "./bin/node.sh", libexec/"bin/node.sh"
	 %w[
	 druid/hadoop-tmp
	 druid/indexing-logs
	 druid/log
	 druid/pids
	 druid/segments
	 druid/task
	 ].each do |dir|
	 (var/dir).mkpath
