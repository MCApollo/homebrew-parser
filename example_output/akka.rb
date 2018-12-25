name :
	 Akka
homepage :
	 https://github.com/akka/akka
url :
	 https://downloads.typesafe.com/akka/akka_2.11-2.4.17.zip
description :
	 Toolkit for building concurrent, distributed, and fault tolerant apps
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
	 rm "bin/akka.bat"
	 chmod 0755, "bin/akka"
	 chmod 0755, "bin/akka-cluster"
	 inreplace ["bin/akka", "bin/akka-cluster"] do |s|
	 s.gsub! /^declare AKKA_HOME=.*$/, "declare AKKA_HOME=#{libexec}"
	 s.gsub! /\r?/, ""
	 end
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/akka"
	 bin.install_symlink libexec/"bin/akka-cluster"
