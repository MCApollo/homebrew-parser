name :
	 VaultCli
homepage :
	 https://jackrabbit.apache.org/filevault/index.html
url :
	 https://search.maven.org/remotecontent?filepath=org/apache/jackrabbit/vault/vault-cli/3.1.40/vault-cli-3.1.40-bin.tar.gz
description :
	 Subversion-like utility to work with Jackrabbit FileVault
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env)
