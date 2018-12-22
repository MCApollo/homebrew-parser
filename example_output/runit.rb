name :
	 Runit
homepage :
	 http://smarden.org/runit
url :
	 http://smarden.org/runit/runit-2.1.2.tar.gz
description :
	 Collection of tools for managing UNIX services
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "runit-#{version}" do
	 system "echo 'cc -Xlinker -x' >src/conf-ld"
	 inreplace "src/Makefile", / -static/, ""
	 inreplace "src/sv.c", "char *varservice =\"/service/\";", "char *varservice =\"#{var}/service/\";"
	 system "package/compile"
	 rcmds = File.read("package/commands")
	 rcmds.split("\n").each do |r|
	 bin.install("command/#{r.chomp}")
	 man8.install("man/#{r.chomp}.8")
	 end
	 (var + "service").mkpath
	 end
