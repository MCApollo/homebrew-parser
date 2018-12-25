name :
	 Gitbucket
homepage :
	 https://github.com/gitbucket/gitbucket
url :
	 https://github.com/gitbucket/gitbucket/releases/download/4.29.0/gitbucket.war
description :
	 Git platform powered by Scala offering
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
	 if build.head?
	 system "ant"
	 libexec.install "war/target/gitbucket.war", "."
	 else
	 libexec.install "gitbucket.war"
	 end
