name :
	 Bfg
homepage :
	 https://rtyley.github.io/bfg-repo-cleaner/
url :
	 https://search.maven.org/remotecontent?filepath=com/madgag/bfg/1.13.0/bfg-1.13.0.jar
description :
	 Remove large files or passwords from Git history like git-filter-branch
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
	 libexec.install "bfg-#{version}.jar"
	 bin.write_jar_script libexec/"bfg-#{version}.jar", "bfg"
