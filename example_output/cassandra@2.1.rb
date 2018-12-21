name :
	 CassandraAT21
homepage :
	 https://cassandra.apache.org
url :
	 https://archive.apache.org/dist/cassandra/2.1.13/apache-cassandra-2.1.13-bin.tar.gz
description :
	 Distributed key-value store
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 (var+"lib/cassandra").mkpath
	 (var+"log/cassandra").mkpath
	 pypath = libexec/"vendor/lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", pypath
	 %w[setuptools thrift futures six cql cassandra-driver].each do |r|
	 resource(r).stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
