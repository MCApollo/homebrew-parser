name :
	 ApacheGeode
homepage :
	 https://geode.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=geode/1.8.0/apache-geode-1.8.0.tgz
description :
	 In-memory Data Grid for fast transactional data processing
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
	 rm_f "bin/gfsh.bat"
	 bash_completion.install "bin/gfsh-completion.bash" => "gfsh"
	 libexec.install Dir["*"]
	 (bin/"gfsh").write_env_script libexec/"bin/gfsh", Language::Java.java_home_env("1.8")
