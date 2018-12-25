name :
	 Carrot2
homepage :
	 https://project.carrot2.org
url :
	 https://github.com/carrot2/carrot2/releases/download/release%2F3.16.0/carrot2-dcs-3.16.0.zip
description :
	 Search results clustering engine
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
	 bin.install libexec/"dcs.sh" => "carrot2"
	 inreplace bin/"carrot2", "java", "cd #{libexec} && exec java"
