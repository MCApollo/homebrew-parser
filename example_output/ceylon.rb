name :
	 Ceylon
homepage :
	 https://ceylon-lang.org/
url :
	 https://ceylon-lang.org/download/dist/1_3_3
description :
	 Programming language for writing large programs in teams
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
	 man1.install Dir["doc/man/man1/*"]
	 doc.install Dir["doc/*"]
	 bin.install "bin/ceylon"
	 bin.install "bin/ceylon-sh-setup"
	 libexec.install Dir["*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
