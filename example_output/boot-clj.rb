name :
	 BootClj
homepage :
	 https://boot-clj.com/
url :
	 https://github.com/boot-clj/boot-bin/releases/download/2.7.2/boot.sh
description :
	 Build tooling for Clojure
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
	 bin.install "boot.sh" => "boot"
