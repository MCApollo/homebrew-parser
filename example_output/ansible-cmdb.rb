name :
	 AnsibleCmdb
homepage :
	 https://github.com/fboender/ansible-cmdb
url :
	 https://github.com/fboender/ansible-cmdb/releases/download/1.30/ansible-cmdb-1.30.tar.gz
description :
	 Generates static HTML overview page from Ansible facts
build_deps :
link_deps :
	 libyaml
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 prefix.install_metafiles
	 man1.install "ansible-cmdb.man.1" => "ansible-cmdb.1"
	 libexec.install Dir["*"] - ["Makefile"]
	 bin.write_exec_script libexec/"ansible-cmdb"
