name :
	 Ringojs
homepage :
	 https://ringojs.org
url :
	 https://github.com/ringo/ringojs/releases/download/v1.2.1/ringojs-1.2.1.tar.gz
description :
	 CommonJS-based JavaScript runtime
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
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
