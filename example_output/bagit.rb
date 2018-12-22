name :
	 Bagit
homepage :
	 https://github.com/LibraryOfCongress/bagit-java
url :
	 https://github.com/LibraryOfCongress/bagit-java/releases/download/v4.12.3/bagit-v4.12.3.zip
description :
	 Library for creation, manipulation, and validation of bags
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 (var/"log/bagit").mkpath
	 inreplace "conf/log4j.properties", "${app.home}/logs", "#{var}/log/bagit"
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/bagit"
