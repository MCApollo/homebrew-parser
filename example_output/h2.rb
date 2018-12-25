name :
	 H2
homepage :
	 https://www.h2database.com/
url :
	 https://www.h2database.com/h2-2018-03-18.zip
description :
	 Java SQL database
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 #
	 h2_script = File.read("bin/h2.sh").gsub("\r\n", "\n")
	 File.open("bin/h2.sh", "w") { |f| f.write h2_script }
	 chmod 0755, "bin/h2.sh"
	 libexec.install Dir["*"]
	 (bin+"h2").write script
