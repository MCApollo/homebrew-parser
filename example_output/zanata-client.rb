name :
	 ZanataClient
homepage :
	 http://zanata.org/
url :
	 https://search.maven.org/remotecontent?filepath=org/zanata/zanata-cli/4.6.2/zanata-cli-4.6.2-dist.tar.gz
description :
	 Zanata translation system command-line client
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"zanata-cli").write_env_script libexec/"bin/zanata-cli", Language::Java.java_home_env("1.8")
	 bash_completion.install libexec/"bin/zanata-cli-completion"
