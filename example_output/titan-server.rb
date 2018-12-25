name :
	 TitanServer
homepage :
	 https://thinkaurelius.github.io/titan/
url :
	 http://s3.thinkaurelius.com/downloads/titan/titan-1.0.0-hadoop1.zip
description :
	 Distributed graph database
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
	 libexec.install %w[bin conf data ext javadocs lib log scripts]
	 bin.install_symlink libexec/"bin/titan.sh" => "titan"
	 bin.install_symlink libexec/"bin/gremlin.sh" => "titan-gremlin"
	 bin.install_symlink libexec/"bin/gremlin-server.sh" => "titan-gremlin-server"
