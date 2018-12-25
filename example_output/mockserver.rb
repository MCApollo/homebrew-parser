name :
	 Mockserver
homepage :
	 https://www.mock-server.com/
url :
	 https://oss.sonatype.org/content/repositories/releases/org/mock-server/mockserver-netty/5.5.0/mockserver-netty-5.5.0-brew-tar.tar
description :
	 Mock HTTP server and proxy
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
	 bin.install_symlink "#{libexec}/bin/run_mockserver.sh" => "mockserver"
	 lib.install_symlink "#{libexec}/lib" => "mockserver"
	 mockserver_log = var/"log/mockserver"
	 mockserver_log.mkpath
	 libexec.install_symlink mockserver_log => "log"
