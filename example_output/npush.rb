name :
	 Npush
homepage :
	 https://npush.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/npush/npush/0.7/npush-0.7.tgz
description :
	 Logic game simliar to Sokoban and Boulder Dash
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
	 system "make"
	 pkgshare.install ["npush", "levels"]
	 (bin/"npush").write <<~EOS
	 #!/bin/sh
	 cd "#{pkgshare}" && exec ./npush $@
	 EOS
