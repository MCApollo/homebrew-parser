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
optional_deps :
conflicts :
resource :
	 ['mysql-connector-python']
	 ['https://github.com/mysql/mysql-connector-python/archive/2.2.2.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resource("mysql-connector-python").stage do
	 system "python", "setup.py", "install", "--prefix=" + libexec
	 end
	 system "python", "setup.py", "install", "--prefix=" + libexec
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
