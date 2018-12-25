name :
	 Questdb
homepage :
	 https://www.questdb.org
url :
	 https://www.questdb.org/download/questdb-1.0.4-bin.tar.gz
description :
	 Time Series Database
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
	 inreplace "questdb.sh", "1.7+", "1.8"
	 rm_rf "questdb.exe"
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/questdb.sh" => "questdb"
