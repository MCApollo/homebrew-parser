name :
	 Cassandra
homepage :
	 https://cassandra.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=cassandra/3.11.3/apache-cassandra-3.11.3-bin.tar.gz
description :
	 Eventually consistent, distributed key-value store
build_deps :
link_deps :
	 cython
	 python
conflicts :
patches :
EOF_patch :
install :
	 (var/"lib/cassandra").mkpath
	 (var/"log/cassandra").mkpath
	 xy = Language::Python.major_minor_version "python3"
	 pypath = libexec/"vendor/lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", pypath
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
