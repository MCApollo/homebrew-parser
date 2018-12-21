name :
	 CassandraAT22
homepage :
	 https://cassandra.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=/cassandra/2.2.11/apache-cassandra-2.2.11-bin.tar.gz
description :
	 Eventually consistent, distributed key-value db
build_deps :
	 cython
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
