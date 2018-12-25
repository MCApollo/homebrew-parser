name :
	 Frege
homepage :
	 https://github.com/Frege/frege/
url :
	 https://github.com/Frege/frege/releases/download/3.24public/frege3.24.405.jar
description :
	 Non-strict, functional programming language in the spirit of Haskell
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
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec/"frege#{version}.jar", "fregec", "-Xss1m"
