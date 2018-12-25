name :
	 Redpen
homepage :
	 http://redpen.cc/
url :
	 https://github.com/redpen-cc/redpen/releases/download/redpen-1.10.1/redpen-1.10.1.tar.gz
description :
	 Proofreading tool to help writers of technical documentation
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
	 libexec.install %w[conf lib sample-doc js]
	 prefix.install "bin"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8+"))
