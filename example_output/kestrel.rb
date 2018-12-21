name :
	 Kestrel
homepage :
	 https://twitter-archive.github.io/kestrel/
url :
	 https://twitter-archive.github.io/kestrel/download/kestrel-2.4.1.zip
description :
	 Distributed message queue
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (var/"log/kestrel").mkpath
	 (var/"run/kestrel").mkpath
	 (var/"spool/kestrel").mkpath
