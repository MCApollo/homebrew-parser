name :
	 Clojure
homepage :
	 https://clojure.org
url :
	 https://download.clojure.org/install/clojure-tools-1.9.0.397.tar.gz
description :
	 The Clojure Programming Language
build_deps :
link_deps :
	 :java
	 rlwrap
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./install.sh", prefix
