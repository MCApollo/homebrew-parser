name :
	 Lumo
homepage :
	 https://github.com/anmonteiro/lumo
url :
	 https://github.com/anmonteiro/lumo/archive/1.9.0.tar.gz
description :
	 Fast, cross-platform, standalone ClojureScript environment
build_deps :
	 boot-clj
	 node
	 yarn
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
	 ENV["BOOT_HOME"] = "#{buildpath}/.boot"
	 ENV["BOOT_LOCAL_REPO"] = "#{buildpath}/.m2/repository"
	 system "boot", "release-ci"
	 bin.install "build/lumo"
