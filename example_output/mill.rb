name :
	 Mill
homepage :
	 https://www.lihaoyi.com/mill/
url :
	 https://github.com/lihaoyi/mill/releases/download/0.3.5/0.3.5
description :
	 Scala build tool
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
	 libexec.install Dir["*"].shift => "mill"
	 chmod 0555, libexec/"mill"
	 (bin/"mill").write_env_script libexec/"mill", Language::Java.java_home_env("1.8")
