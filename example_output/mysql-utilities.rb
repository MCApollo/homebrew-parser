name :
	 MysqlUtilities
homepage :
	 https://dev.mysql.com/downloads/utilities/
url :
	 https://github.com/mysql/mysql-utilities/archive/release-1.6.5.tar.gz
description :
	 Tools for maintaining and administering MySQL servers
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resource("mysql-connector-python").stage do
	 system "python", "setup.py", "install", "--prefix=" + libexec
